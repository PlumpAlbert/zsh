#!/bin/zsh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
source "${ZDOTDIR}/config.zsh"


zinit wait lucid light-mode for \
	atinit"zicompinit; zicdreplay" \
		zdharma-continuum/fast-syntax-highlighting \
	atload"_zsh_autosuggest_start" \
		zsh-users/zsh-autosuggestions \
	blockf atpull'zinit creinstall -q .' \
		zsh-users/zsh-completions \
	OMZP::colored-man-pages

# install direnv
zinit from'gh-r' as'program' mv'direnv* -> direnv' \
	atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
	pick'direnv' src='zhook.zsh' for \
		direnv/direnv

# load starship
zinit as"command" from"gh-r" \
	atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
	atpull"%atclone" src"init.zsh" for \
		starship/starship

zinit wait="1" lucid for \
	lukechilds/zsh-nvm \
	Aloxaf/fzf-tab \
	agkozak/zsh-z

source "$ZDOTDIR/aliases.zsh"

if [[ -z "$TMUX" ]]; then
	tmux new -At main
	exit;
fi
