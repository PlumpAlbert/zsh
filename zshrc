#!/bin/zsh

source "${ZDOTDIR}/config.zsh"

source "$ZDOTDIR/aliases.zsh"

if [[ -z "$TMUX" ]]; then
	tmux new -At main
	exit;
fi
