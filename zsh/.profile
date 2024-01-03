PATH="$HOME/.local/bin:$PATH"
unset npm_config_prefix
export DOTFILES="$HOME/.dotfiles"
export COLEMAK="$(lsusb | grep -c 'ErgoDox')"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

export XL_SECRET_PROVIDER=FILE
export DXVK_FRAME_RATE=60

