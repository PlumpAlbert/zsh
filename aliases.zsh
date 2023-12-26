#!/bin/zsh

alias sudo='sudo ' # enable expansion for `sudo` commands

alias zcr='source ${ZDOTDIR:-$HOME}/.zshrc'
alias zce='${EDITOR:-vim} ${ZDOTDIR:-$HOME}/.zshrc'

alias lg=lazygit

alias v='${EDITOR:-vim}'
alias sv='sudo -A ${EDITOR:-vim}'

if [[ $commands[nvim] && $commands[fzf] && $commands[fd] ]]; then
	alias vim='nvim'
	function vv() {
		local config=$(
			fd --max-depth 1 --glob 'nvim*' "${XDG_CONFIG_HOME:-$HOME/.config}" \
				| sed 's|.*/\(.*\)/$|\1|' \
				| fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0 \
		)

		[[ -z $config ]] && echo "No config was selected" && return

		NVIM_APPNAME=$(basename "${config}") nvim $@
	}
fi

if [ $commands[tmuxp] ]; then
	alias txf='tmuxp freeze'
	alias txl='tmuxp load -y .'
fi

if [[ $TERM == 'xterm-kitty' ]]; then
	alias ssh='kitten ssh'
fi
