#!/bin/sh
#
# ~/.xinitrc
# Executed by startx
#

# [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap && export KEYBOARD=colemak

numlockx &

xrandr --output DisplayPort-0 --mode 1920x1080 --output HDMI-A-1 --auto --left-of DisplayPort-0 --output HDMI-A-0 --auto --right-of DisplayPort-0

exec i3
