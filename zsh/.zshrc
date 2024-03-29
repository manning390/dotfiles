# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Profile
[[ -f ~/.profile ]] && source ~/.profile

export DOTFILES=~/.dotfiles

KEYTIMEOUT=1

# Scripts
for f in ~/.scripts/*; do
  source $f
done

export PATH=~/.local/bin:/opt/homebrew/bin:/usr/bin:$PATH

setopt no_list_ambiguous
ALWAYS_TO_END=true

# export NVM_LAZY_LOAD=true
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
# And just better compeletion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsh/last-working-directory.plugin.zsh ] && source ~/.zsh/last-working-dir.plugin.zsh

fpath=($fpath "/Users/michaelmanning/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Welcome Message
echo "Hi. Hello. Welcome. <3"
