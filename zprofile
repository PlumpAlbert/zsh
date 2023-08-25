#!/bin/zsh

if [[ -z $DISPLAY && -z $WAYLAND_DISPLAY && $TTY == '/dev/tty1' ]]; then
	which Hyprland >/dev/null 2>&1

	[ $? -eq 0 ] && Hyprland || startx

	exit
fi

if [[ $ZSH_TMUX == "true" && -z "$TMUX" ]]; then
	tmux new -At main
	exit;
fi
