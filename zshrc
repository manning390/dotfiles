# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Scripts
for f in ~/.scripts/*; do
  source $f
done

export PATH=/usr/bin:~/.local/bin:/opt/homebrew/bin:$PATH


export NVM_LAZY_LOAD=true
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=($fpath "/Users/michaelmanning/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
