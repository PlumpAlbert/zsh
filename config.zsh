#!/bin/env zsh

bindkey -e
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H"   beginning-of-line
bindkey "^[[F"   end-of-line
bindkey "^[[3~"  delete-char
bindkey '^H' backward-kill-word
bindkey '5~' kill-word
bindkey '^X^E' edit-command-line

setopt PROMPTSUBST
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt EXTENDED_GLOB
setopt SHARE_HISTORY
setopt HIST_SAVE_NO_DUPS
