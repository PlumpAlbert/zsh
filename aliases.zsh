#!/bin/zsh

alias zcr='source ${ZDOTDIR:-$HOME}/.zshrc'
alias zce='${EDITOR:-vim} ${ZDOTDIR:-$HOME}/.zshrc'

alias lg=lazygit

if [ $commands[nvim] ]; then
	alias vim=nvim
	alias v=nvim
fi

if [ $commands[tmuxp] ]; then
	alias txf='tmuxp freeze'
	alias txl='tmuxp load -y .'
fi
