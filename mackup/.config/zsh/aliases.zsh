#!/bin/sh
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
alias nvimdot='nvim ~/Workspace/Coding/dotfiles'

# tools
alias nv="TERM=alacritty nvim"
alias nvim="TERM=alacritty nvim"
# abbr :q "tmux kill-server"  # not work..
alias tn="tmux new -s $(pwd | sed 's/.*\///g')"
alias sio="/Applications/sioyek.app/Contents/MacOS/sioyek"
alias l="lsd  --group-dirs first -A"
# abbr ld "lazydocker"
alias lg="lazygit"
alias csvt="csvtools readable"
# lsd is a modern ls alternative with highlight. (similar to exa)
alias ll="lsd  --group-dirs first -Al"
alias lt="lsd  --group-dirs last -A --tree"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# use bat to replace cat
if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"Visual Studio Dark+\"" 
  alias catt="bat --theme \"Visual Studio Dark+\"" 
fi
# TODO: add python gpu process killer
