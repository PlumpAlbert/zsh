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

# {{{ set options
HISTSIZE=5000
HISTFILE="$HOME/.cache/zsh_history"
SAVEHIST="$HISTSIZE"
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt auto_cd
setopt auto_menu
setopt magic_equal_subst

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
# }}}

# {{{ oh-my-zsh
zi wait lucid light-mode for \
	OMZL::git.zsh \
	OMZL::prompt_info_functions.zsh \
		atload"unalias grv" OMZP::git \
	OMZP::python \
	OMZP::colored-man-pages \
	OMZP::sudo \
	OMZP::gitignore \
	OMZP::kubectl
# }}}

# {{{ Installing programs

# {{{ fzf
zi ice from"gh-r" as"program"
zi light junegunn/fzf
eval "$( fzf --zsh )"
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

# {{{ bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
if ! [ -d "$BUN_INSTALL" ]; then
	curl -fsSL https://bun.sh/install | bash
fi
# bun completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
# }}}

# {{{ starship theme
zi ice as"command" from"gh-r" \
	atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
	atpull"%atclone" src"init.zsh"
zi light starship/starship
# }}}

# {{{ zoxide
zi ice as'null' from"gh-r" sbin
zi light ajeetdsouza/zoxide
eval "$( zoxide init --cmd cd zsh )"
# }}}

# {{{ direnv
zi ice wait lucid from"gh-r" as"program" \
	mv"direnv* -> direnv" \
	atclone"./direnv hook zsh > init.zsh" \
	atpull"%atclone" src"init.zsh"
zi light direnv/direnv
# }}}

# {{{ github cli
zi ice as"command" from"gh-r" \
	mv"gh*/bin/gh -> gh" \
	atclone"./gh completion -s zsh > _gh" \
	atpull"%atclone"
zi light cli/cli
# }}}

#{{{ neovim
zi ice as'program' from'gh-r' ver"nightly" bpick'*.tar.gz' sbin'**/bin/nvim -> nvim'
zi light neovim/neovim
#}}}

#{{{ sesh
zi ice as"program" from"gh-r"
zi light joshmedeski/sesh
#}}}

# }}}

# {{{ base

zi light z-shell/F-Sy-H
zi light z-shell/z-a-rust
zi light Aloxaf/fzf-tab

zi ice lucid wait as"completion"
zi light zsh-users/zsh-completions

export GPG_TTY=$(tty)
export SSH_AGENT_PID=""
export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
export GPG_AGENT_SOCK="$HOME/.gnupg/S.gpg-agent"
gpg-agent --daemon --enable-ssh-support >/dev/null 2>&1

# }}}

# {{{ aliases

alias ez="$EDITOR '$HOME/.zshrc'; source '$HOME/.zshrc'"

if ! [ -z $commands[yay] ]; then
	alias yay="https_proxy=socks5h://vpn.plumpalbert.xyz:37456 http_proxy=socks5h://vpn.plumpalbert.xyz:37456 ${commands[yay]}"
fi

if ! [ -z $commands[tmux] ]; then
	alias t='sesh connect "$( sesh list -i | fzf )"'
fi

# }}}
