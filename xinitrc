#!/bin/sh
#
# ~/.xinitrc
# Executed by startx
#

setxkbmap -option caps:escape

numlockx &

exec i3
