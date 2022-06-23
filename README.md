# Manning390 Dotfiles

Welcome to my personal configuration hell. We're trying to tidy things up. Don't mind the parts on fire.

## Arch

Ensure neovim version is >0.5.0 or there will be issues with plugins

```
paru -S stow neovim python-pynim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
./.dotfiles/ARCH
```
