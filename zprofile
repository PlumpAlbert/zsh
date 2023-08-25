#!/bin/zsh

if [[ -z $DISPLAY && -z $WAYLAND_DISPLAY && $TTY == '/dev/tty1' ]]; then
	command Hyprland >/dev/null 2>/dev/null
	[ $? -eq 0 ] && Hyprland || startx
	exit
fi

if [[ -z "$TMUX" ]]; then
	tmux new -At main
	exit;
fi
