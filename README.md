# Dotfile Configurations

In order to better organize configurations between environments I'll be keeping all of my configurations here in this dotfile repo.

The installation scripts will install all dependencies, edit manually to remove any installation.

Heavily inspired by [@FatBoyXPC](https://github.com/colbycheeze/dotfiles) and [@colbycheeze](https://github.com/colbycheeze/dotfiles) implementations. Uses [dotbot](https://github.com/anishathalye/dotbot) for dot file linking.

# Installation

Download this repo (or clone) to ```~/.dotfiles```

Run ```pinstall.sh``` for dependencies for ```install.sh```
- git
- curl
- zsh
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

Run ```install.sh``` for applications and configs
- tmux
- curl
- wget
- zip
- unzip
- htop
- jq
- cut
- xsel
- [silversearcher-ag](https://github.com/ggreer/the_silver_searcher)
- software-properties-common
- python-dev
- python-pip
- python3-dev
- python3-pip
- python-gpg
- openvpn
- [openpyn](https://github.com/jotyGill/openpyn-nordvpn) (via pip)
- neovim
- dropbox
- weechat
- fonts-firacode
- [powerline fonts](https://github.com/powerline/fonts) (via git)
- [PHP](https://secure.php.net/releases/?json) (Installs latest version with following mods)
  - cli
  - gd
  - mysql
  - pgsql
  - imap
  - memcached
  - mbstring
  - xml
  - curl
  - bcmath
  - sqlite3
  - xdebug
- Composer (via php)
  - [hirak/prestissimo](https://github.com/hirak/prestissimo)
  - phpunit/phpunit
  - phpunit/php-invoker
