zpm_root="${XDG_DATA_HOME:-$HOME/.local/share}/zpm"

if [[ ! -d ${zpm_root} ]]; then
  git clone --recursive https://github.com/zpm-zsh/zpm ${zpm_root}
fi
source "${zpm_root}/zpm.zsh"

# plugins
zpm load @omz

zpm load \
	zdharma-continuum/fast-syntax-highlighting \
	zdharma-continuum/history-search-multi-word \
	zsh-users/zsh-autosuggestions \
	zsh-users/zsh-completions \
	@omz/lib/completion \
	@omz/colored-man-pages \
	@omz/sudo \
	zpm-zsh/ls \
	rupa/z \
	lukechilds/zsh-nvm \
	Aloxaf/fzf-tab \
	sindresorhus/pure
