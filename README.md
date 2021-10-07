## Mac OS
### Stow
```
brew install stow
```
#### Neovim

```
brew install --HEAD neovim
```

Ensure version is >0.5.0 or there will be issues with plugins

#### Neovim Plugged

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
``````
#### Finally do the thing

```
./.dotfiles/OSX
```

## Arch

### Stow
 ???

#### Neovim

```
paru -S neovim python-pynim
```

Ensure version is >0.5.0 or there will be issues with plugins

#### Neovim Plugged

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
``````
