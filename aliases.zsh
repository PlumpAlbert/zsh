#!/bin/zsh

alias sudo='sudo ' # enable expansion for `sudo` commands

alias zcr='source ${ZDOTDIR:-$HOME}/.zshrc'
alias zce='${EDITOR:-vim} ${ZDOTDIR:-$HOME}/.zshrc'

alias lg=lazygit

alias v='${EDITOR:-vim}'
alias sv='sudo -A ${EDITOR:-vim}'

if [ $commands[tmuxp] ]; then
	alias txf='tmuxp freeze'
	alias txl='tmuxp load -y .'
fi

if [[ $TERM == 'xterm-kitty' ]]; then
	alias ssh='kitten ssh'
fi
