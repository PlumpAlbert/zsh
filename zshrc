#!/bin/zsh

source "${ZDOTDIR}/config.zsh"
source "${ZDOTDIR}/aliases.zsh"

source "${ZDOTDIR}/zinit/install.zsh"
source "${ZDOTDIR}/zinit/plugins.zsh"

if [ $commands[direnv] ]; then
	eval "$(direnv hook zsh)"
fi
