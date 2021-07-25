#!/bin/sh
#
# ~/.xinitrc
# Executed by startx
#

# [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap && export KEYBOARD=colemak

numlockx &

exec i3
