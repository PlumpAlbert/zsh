zinit wait lucid light-mode for \
	willghatch/zsh-saneopt \
	zdharma-continuum/history-search-multi-word \
	atinit"zicompinit; zicdreplay" \
		zdharma-continuum/fast-syntax-highlighting \
	atload"_zsh_autosuggest_start" \
		zsh-users/zsh-autosuggestions \
	blockf atpull'zinit creinstall -q .' \
		zsh-users/zsh-completions \
	OMZP::colored-man-pages \
	OMZP::sudo \
	OMZL::clipboard.zsh \
	rupa/z \
	zpm-zsh/ls \
	lukechilds/zsh-nvm \
	Aloxaf/fzf-tab

zinit light sindresorhus/pure
