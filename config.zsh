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

setopt promptsubst auto_cd auto_pushd extended_glob hist_ignore_dups inc_append_history
