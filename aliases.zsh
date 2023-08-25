#!/bin/zsh

which exa >/dev/null 2>&1

[ $? -eq 0 ] && alias ls='exa' || alias ls='ls --color'
alias la='ls -a'
alias l='ls -l'
alias lla='ls -al'

alias lg=lazygit

alias vim=nvim
alias v=nvim
