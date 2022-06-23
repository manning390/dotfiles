# Uses 1password-cli and jq

# Create helpers functions
function opon() {
    if [[ -z $OP_SESSION_my ]]; then
        eval $(op signin my)
    fi
}
function opoff() {
    op signout
    unset OP_SESSION_my
}
function opp() {
    opon
    i=$1
    if [[ -n $OP_SESSION_my ]]; then
        if [[ -n $OP_CACHED_UUID ]]; then
            i=$OP_CACHED_UUID
        fi
        op get item $i | jq -r '.details.fields[] | select(.designation=="password").value' | xclip -selection clipboard
    fi
}
function opw() {
    opon
    i=$1
    if [[ -n $OP_SESSION_my ]]; then
        if [[ -n $OP_CACHED_UUID ]]; then
            i=$OP_CACHED_UUID
        fi

        u=$(op get item $i | jq -r '.details.fields[] | select(.designation=="username").value')
        echo $u
        echo $u | xclip -selection clipboard
    fi
}
function ops() {
    opon
    if [[ -n $OP_SESSION_my ]]; then
        t=$(op list items --categories Login | jq -c '.[]|.overview.title' |tr -d '\042'| fzf --preview 'op get item {} | jq "{title: .overview.title, url: .overview.url, uuid: .uuid}"')
        export OP_CACHED_UUID=$(op get item $t --cache | jq -r '.uuid' | tr -d '\042')
        echo "Cached Search, Password in clipboard"
        opp
    fi
}
