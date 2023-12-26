export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export EDITOR=nvim
export VISUAL=nvim
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/bin:$HOME/.local/scripts:$HOME/.cargo/bin:$PATH"

export HISTFILE="${HOME}/.cache/zsh_history"
export SAVEHIST=1000

[ -f "/lib/ssh/x11-ssh-askpass" ] \
	&& export SUDO_ASKPASS="/lib/ssh/x11-ssh-askpass"
