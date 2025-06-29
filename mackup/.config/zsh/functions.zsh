#!/bin/sh

# Use lf to switch directories and bind it to cmd+f in alacrrity keybinds
function lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# extract archives -- usage: extract <file>
function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
      *.tar.gz) tar xzf $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) unrar e $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xf $1 ;;
      *.tbz2) tar xjf $1 ;;
      *.tgz) tar xzf $1 ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress $1 ;;
      *.7z) 7z x $1 ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Function: ff
# Description: Lists all active windows managed by the 'aerospace' window manager using fzf.
#              Allows the user to fuzzy-find and select a window, then focuses on the selected window.
# Usage: ff
function ff () {
    # Check if 'aerospace' command exists
    if ! command -v aerospace &> /dev/null; then
        echo "Error: 'aerospace' command not found. Please install aerospace window manager."
        return 1
    fi

    # List all aerospace windows, pipe to fzf for interactive selection,
    # and bind 'Enter' key to focus on the selected window.
    aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
}
