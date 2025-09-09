#!/bin/bash

MYDIR="$HOME/Workspace/Coding"
cd ~ && mkdir -p "$MYDIR" && cd "$MYDIR" || exit
git clone https://github.com/RebornHugo/dotfiles.git dotfiles

if [ "$(uname)" = "Darwin" ]; then
  brew install bash
  brew install cmake
  brew install tmux
  brew install git
  brew install htop
  brew install trash-cli
  # brew install skhd
  # brew services start skhd
  brew install --cask nikitabobko/tap/aerospace
  # brew install yabai
  # brew services start yabai
  # https://felixkratz.github.io/SketchyBar/setup
  # https://github.com/FelixKratz/dotfiles
  brew install sketchybar
  brew install lazydocker
  brew install lazygit
  brew install lf
  brew install yq
  brew install stats
  brew install orbstack # docker-cli alternative
  brew install neovide
  brew install pandoc
  # font
  brew tap homebrew/cask-fonts
  ## brew install --cask https://raw.githubusercontent.com/Homebrew/homebrew-cask-fonts/c6f6dbdf5da109fdcc01d86703bd7d64329f143d/Casks/font-jetbrains-mono-nerd-font.rb
  brew install --cask font-jetbrains-mono-nerd-font
  brew tap epk/epk
  brew install --cask font-sf-mono-nerd-font
  # brew install fish
elif [ "$(uname)" = "Linux" ]; then
  # for ssh clipboard
  apt install -y xclip
  apt install -y xsel

  echo "building tmux for ubuntu"
  apt remove -y tmux && apt update -y && apt install -y libncurses5-dev libncursesw5-dev
  wget https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz && tar -zxf tmux-*.tar.gz
  cd tmux-*/ || exit
  ./configure
  make && sudo make install
  cd "$MYDIR" || exit
  /bin/rm tmux-3.3a.tar.gz

  echo "installing fish, lf, lazygit for ubuntu"
  # apt-add-repository ppa:fish-shell/release-3 &&apt-get autoclean &&  apt-get update && apt-get install -y fish

  # golang pkg installed by homebrew has bug in ubuntu
  # install lf manager
  curl -L https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz | tar xzC /usr/local/bin
  # install lazygit
  add-apt-repository ppa:lazygit-team/release && apt update && apt install -y lazygit
fi

brew install bat
# brew install fd
# brew install gh
# brew install git-delta
brew install fzf
brew install lsd
brew install mackup
brew install fastfetch
brew install neovim
brew install npm
brew install ripgrep
brew install starship
brew install tealdeer
# brew install wakatime-cli
brew install zoxide
brew install gnu-sed # used for spectre
brew install so
brew tap arl/arl
brew install gitmux

# install gitmux
if [ "$(uname)" = "Darwin" ]; then
  wget --output-document gitmux.tar.gz https://github.com/arl/gitmux/releases/download/v0.7.10/gitmux_0.7.10_macOS_amd64.tar.gz
elif [ "$(uname)" = "Linux" ]; then
  wget --output-document gitmux.tar.gz https://github.com/arl/gitmux/releases/download/v0.7.10/gitmux_0.7.10_linux_amd64.tar.gz
fi
tar xzf gitmux.tar.gz
mv gitmux /usr/local/bin/gitmux
/bin/rm gitmux.tar.gz

# brew tap clementtsang/bottom
# brew install bottom
# brew tap federico-terzi/espanso
# brew install espanso

# mackup
ln -s "$MYDIR/dotfiles/mackup/.mackup.cfg" ~/.mackup.cfg
ln -s "$MYDIR/dotfiles/mackup/.mackup" ~/.mackup
# ln -s /Users/hugoreborn/Workspace/Coding/dotfiles/mackup/.mackup.cfg /Users/hugoreborn/.mackup.cfg

# TODO: check user name instead of system name
if [ "$(uname)" = "Darwin" ]; then
  mackup restore
elif [ "$(uname)" = "Linux" ]; then
  mackup restore -r
fi

# place fzf keybinding after mackup to avoid warning
"$(brew --prefix)"/opt/fzf/install --all

# fisher https://github.com/jorgebucaran/fisher
# curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# fisher install FabioAntunes/fish-nvm edc/bass franciscolourenco/don
# chsh -s "$(which fish)"

# fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/HEAD/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
# fish -c "fisher install FabioAntunes/fish-nvm edc/bass franciscolourenco/don"
# chsh -s "$(which fish)"

# install zap
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
# zap --update

# cp "$HOME/.fzf/shell/key-bindings.fish" "$MYDIR/dotfiles/mackup/.config/fish/functions/fzf_key_bindings.fish"

# nvm https://github.com/nvm-sh/nvm
# mkdir ~/.nvm
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
# nvm install 'lts/*'

# vimplug https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall

# tpm https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# casks
if [ "$(uname)" = "Darwin" ]; then
  # brew install --cask 1password
  brew install --cask alacritty
  brew install --cask kitty
  brew install --cask xquartz
  brew install --cask raycast # free alternative to alfred
  brew install --cask discord
  brew install --cask obsidian
  brew install --cask slack
  brew install --cask feishu
  brew install --cask telegram
  brew install --cask spotify
  brew install --cask sioyek
  brew install --cask karabiner-elements
  brew install --cask clashx
  brew install --cask stats
  brew install --cask wechat
  brew install --cask visual-studio-code
  brew install --cask cursor
  brew install --cask zotero
  brew install --cask dropbox
  brew install --cask vlc
  brew install --cask qq
  brew install --cask zoom
  brew install --cask anki
  brew install --cask futubull
  # brew install --cask forticlient
  # brew install --cask trello # install through app store

  echo "increase keystroke speed"
  defaults write -g KeyRepeat -int 1         # 1 for 15ms
  defaults write -g InitialKeyRepeat -int 13 # 13 for 195ms
  # For VSCode
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
  # For AeroSpace https://nikitabobko.github.io/AeroSpace/goodies#move-by-dragging-any-part-of-the-window
  defaults write -g NSWindowShouldDragOnGesture -bool true
elif [ "$(uname)" = "Linux" ]; then
  # in case homebrew overwrite system python3 and pip3
  # NOTE: maybe just set: ENV PATH "$PATH:/home/linuxbrew/.linuxbrew/bin"  ??? even in mac os
  # ln -s /usr/bin/python3 /home/linuxbrew/.linuxbrew/bin/python3
  echo "linux doesn't need to install cask"
fi

# lsp
# pip3 install black
# pip3 install flake8
# brew install shellcheck
# npx @johnnymorganz/stylua-bin --help  # lua format still not work
# npm is not excutable

# PackerSync silently
# nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless "+Lazy! sync" +qa
# TODO: add LazySync silently

# lsp related..
pip3 install debugpy
brew install shellcheck
brew install prettier
brew install shfmt
