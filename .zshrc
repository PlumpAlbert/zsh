# vim:foldenable:foldmethod=marker:

# {{{ Install zi
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://wiki.zshell.dev/ecosystem/category/-annexes
zicompinit # <- https://wiki.zshell.dev/docs/guides/commands
zi light-mode for \
  z-shell/z-a-meta-plugins \
  @annexes # <- https://wiki.zshell.dev/ecosystem/category/-annexes
# examples here -> https://wiki.zshell.dev/community/gallery/collection
zicompinit # <- https://wiki.zshell.dev/docs/guides/commands
# }}}

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

zinit light z-shell/F-Sy-H
zinit light z-shell/z-a-rust

# {{{ Installing programs

# {{{ fzf
zi ice wait lucid from"gh-r" as"program"
zi light junegunn/fzf
# }}}

# {{{ ripgrep
zi ice wait lucid from"gh-r" as"program" mv"ripgrep*/rg -> rg"
zi light BurntSushi/ripgrep
# }}}

# {{{ eza
zi ice wait lucid from"gh-r" as"program"
zi light eza-community/eza

alias ls="eza --icons=always --group-directories-first"
alias l="ls -l"
alias la="ls -A"
alias lla="ls -lA"
# }}}

# {{{ fd
zi ice wait lucid from"gh-r" as"program" mv"fd*/fd -> fd"
zi light sharkdp/fd
# }}}

# {{{ bat
zi ice wait lucid from"gh-r" as"program" mv"bat*/bat -> bat"
zi light sharkdp/bat
# }}}

# {{{ lazygit
zi ice wait lucid from"gh-r" as"program"
zi light jesseduffield/lazygit

alias lg='lazygit'
# }}}

# {{{ fnm (node.js)
zi ice wait lucid atinit"ZSH_FNM_NODE_VERSION=18; ZSH_FNM_INSTALL_DIR=${HOME}/.local/share/fnm"
zi light "dominik-schwabe/zsh-fnm"
# }}}

# {{{ starship theme
zi ice wait lucid as"command" from"gh-r" \
	atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
	atpull"%atclone" src"init.zsh"
zi light starship/starship
# }}}

# }}}
