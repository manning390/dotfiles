#!/bin/sh
#
# ~/.xinitrc
# Executed by startx
#

# [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap && export KEYBOARD=colemak

numlockx &

xrandr --output DisplayPort-0 --mode 2560x1440 --output HDMI-A-1 --mode 2560x1440 --auto --right-of DisplayPort-0 --output HDMI-A-0 --mode 2560x1440 --auto --left-of DisplayPort-0

# exec awesome
exec i3
