#!/bin/sh

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTFILE=~/.zsh_history

# source
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/functions.zsh"

# autosuggest and completion setting
## case insensitive path-completion (better to add in supercharge)
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

## color setting
_ls_colors="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
## tab suggestion uses ls color, ref: https://github.com/ohmyzsh/ohmyzsh/issues/6060#issuecomment-572863893
zstyle ':completion:*:default' list-colors "${(s.:.)_ls_colors}"
## tab matching prefix uses specific color: ref: https://stackoverflow.com/a/16149200
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)_ls_colors}")';

# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#808080'
# plugins
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
# plug "zap-zsh/zap-prompt"  # zsh theme, much slower than starship
plug "zap-zsh/fzf"
# plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FZF
export FZF_CTRL_R_OPTS="--reverse --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_COMMAND="fd -H -E '.git'"
export FZF_DEFAULT_OPTS="--color=spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD"
export FZF_TMUX_OPTS="-p"

# brew
export HOMEBREW_NO_AUTO_UPDATE=1

# keybindings
bindkey '^f' autosuggest-accept
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward
