# if status is-interactive
    # Commands to run in interactive sessions can go here
# end

# reference: https://github.com/joshmedeski/dotfiles/blob/main/mackup/.config/fish/config.fish
set fish_greeting # disable fish greeting

starship init fish | source
zoxide init fish | source

# variables
set -U BAT_THEME Nord 
set -U EDITOR nvim
set -U FZF_CTRL_R_OPTS "--reverse --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
set -U FZF_DEFAULT_COMMAND "fd -H -E '.git'"
set -U FZF_DEFAULT_OPTS "--color=spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD"
set -U FZF_TMUX_OPTS "-p"
set -U LANG en_US.UTF-8
set -U LC_ALL en_US.UTF-8

fish_add_path /usr/local/bin
fish_add_path $HOME/.config/bin



# fzf installation: fisher install jethrokuan/fzf; FIXME!!!

# Load HomeBrew
export HOMEBREW_NO_AUTO_UPDATE=1

# fish colors
set -U fish_color_autosuggestion purple
set -U fish_color_command normal
set -U fish_color_error red
set -U fish_color_param cyan
set -U fish_color_redirections yellow
set -U fish_color_terminators white
set -U fish_color_valid_path green

# abbreviations
abbr nv "nvim"
abbr :q "tmux kill-server"  # not work..
abbr tn "tmux new -s (pwd | sed 's/.*\///g')"
abbr sio "/Applications/sioyek.app/Contents/MacOS/sioyek"
abbr l "lsd  --group-dirs first -A"
# abbr ld "lazydocker"
abbr lg "lazygit"

# lsd is a modern ls alternative with highlight. (similar to exa)
abbr ll "lsd  --group-dirs first -Al"
abbr lt "lsd  --group-dirs last -A --tree"
