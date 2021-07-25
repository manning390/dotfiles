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
    p=$(op get item "$1" | jq -r '.details.fields[] | select(.designation=="password").value')
    # echo $p
    echo $p | xclip -selection clipboard
}
opw() {
    opon
    u=$(op get item "$1" | jq -r '.details.fields[] | select(.designation=="username").value')
    echo $u
    echo $u | xclip -selection clipboard
}

