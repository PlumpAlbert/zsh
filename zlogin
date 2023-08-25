#!/usr/bin/env zsh

if [[ -z $WAYLAND_DISPLAY && $TTY == '/dev/tty1' ]]; then
	Hyprland
	exit
fi
