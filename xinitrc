#!/bin/sh
setxkbmap -layout us,ru -option grp:win_space_toggle 
setxkbmap -option caps:escape
#xwallpaper --zoom ~/Pictures/wp3.jpg
picom --config ~/repos/dotfiles/picom.conf --vsync -b 
dwmbar &
exec startdwm
