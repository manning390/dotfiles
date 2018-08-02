#!/bin/bash

# Define functions
fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

fancy_echo_line() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt" "$@"
}

append_to_zshrc() {
  local text="$1" zshrc
  local skip_new_line="${2:-0}"

  if [ -w "$HOME/.zshrc.local" ]; then
    zshrc="$HOME/.zshrc.local"
  else
    zshrc="$HOME/.zshrc"
  fi

  if ! grep -Fqs "$text" "$zshrc"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\n" "$text" >> "$zshrc"
    else
      printf "\n%s\n" "$text" >> "$zshrc"
    fi
  fi
}

# Check Pre-Install
echo "Did you need to run a pre-install (pinstall.sh)? ^C now if you do, otherwise continue with enter..."
read throwawayinput

# Repositories
fancy_echo "Adding Repositories apt"
sudo add-apt-repository -y ppa:ondrej/php
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo add-apt-repository -y universe

# Install scripts
fancy_echo "Updating apt"
sudo apt update

fancy_echo "Installing CLI tools"
sudo apt install -y tmux curl wget zip unzip htop jq cut xsel silversearcher-ag

fancy_echo "Installing Python"
sudo apt install -y software-properties-common python-dev python-pip python3-dev python3-pip python-gpg

# fancy_echo "Installing Dropbox"
# Need to update the wget to work
if ! [ -x "$(command -v dropbox)" ]; then
    wget -O ~/dropbox-delete/dropbox.deb "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb"
    sudo apt install -y ~/dropbox-delete/dropbox.deb && rm -rf ~/dropbox-delete
fi

fancy_echo "Weechat"
sudo apt install -y weechat

fancy_echo "Installing Nord VPN Manager"
sudo apt install -y openvpn
sudo python3 -m pip install openpyn --upgrade
#sudo openpyn --init

fancy_echo "Installing Neovim"
sudo apt install -y neovim

#fancy_echo "Setting up tmux"
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

fancy_echo "Installing Firacode font"
sudo apt install -y fonts-firacode

fancy_echo "Installing Powerline font"
git clone git@github.com:powerline/fonts.git ~/fonts-delete && ~/fonts-delete/install.sh && rm -rf ~/fonts-delete

# PHP
PHPLATEST="$(curl -s 'https://secure.php.net/releases/?json' | jq '[.[] | .version][0]' | cut -c2-4)"
fancy_echo "Installing PHP version ${PHPLATEST}"
sudo apt install -y php${PHPLATEST}-cli php${PHPLATEST}-gd php${PHPLATEST}-mysql php${PHPLATEST}-pgsql php${PHPLATEST}-imap php${PHPLATEST}-memcached php${PHPLATEST}-mbstring php${PHPLATEST}-xml php${PHPLATEST}-curl php${PHPLATEST}-bcmath php${PHPLATEST}-sqlite3 php${PHPLATEST}-xdebug

fancy_echo "Install Composer with global plugins"
if ! [ -x "$(command -v composer)" ]; then
    php -r "readfile('http://getcomposer.org/installer');" | sudo php -- --install-dir=/usr/bin/ --filename=composer
fi
composer global require hirak/prestissimo phpunit/phpunit phpunit/php-invoker -q -n

# Dotbot
set -e

CONFIG="install.conf.yaml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASEDIR}"
git submodule update --init --recursive "${DOTBOT_DIR}"

"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"
