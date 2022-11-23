#!/bin/sh
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"

export PATH="$HOME/.local/bin":/usr/local/bin:$HOME/.config/bin:$PATH

# Use starship instead of zsh's theme, reference: https://www.youtube.com/watch?v=Mu4frtvHPOY
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
# eval "`pip completion --zsh`"

# export TERM=screen-256color
export PATH=$PATH:/usr/local/opt/llvm/bin/
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"

export BAT_THEME=Nord 


# LF icons
[ -f ~/.config/zsh/LF_ICONS ] && {
	LF_ICONS="$(tr '\n' ':' <~/.config/zsh/LF_ICONS)" \
		&& export LF_ICONS
}

# locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export TERM="xterm-256color"
