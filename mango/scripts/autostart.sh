#!/bin/bash
python ~/.config/mango/scripts/wallpaper.py
if [ $(pgrep waybar) ] ; then
	killall -9 waybar 2>/dev/null
fi
#waybar 2>/dev/null &
