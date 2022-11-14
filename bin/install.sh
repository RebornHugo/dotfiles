#!/bin/bash

MYDIR="$HOME/Workspace/Coding"
cd ~ && mkdir -p "$MYDIR" && cd "$MYDIR" || exit
git clone https://github.com/RebornHugo/dotfiles.git dotfiles

if [ "$(uname)" = "Darwin" ]; then
  brew install bash
  brew install cmake
  brew install tmux
  brew install git
  brew install trash-cli
  brew install skhd
  brew services start skhd
  brew install yabai
  brew services start yabai
elif [ "$(uname)" = "Linux" ]; then
  echo "linux need remove deprecated apt pkgs"
  apt remove -y tmux
  apt update -y
  apt install -y libncurses5-dev libncursesw5-dev
  wget https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
  tar -zxf tmux-*.tar.gz
  cd tmux-*/ || exit
  ./configure
  make && sudo make install
  cd "$MYDIR" || exit
  /bin/rm tmux-3.3a.tar.gz
  # brew install xxx
fi

brew install bat
# brew install fd
brew install fish
# brew install gh
# brew install git-delta
brew install fzf
brew install lazydocker
brew install lazygit
brew install lf
brew install lsd
brew install mackup
brew install neofetch
brew install neovim
brew install npm
brew install ripgrep
brew install starship
brew install tealdeer
# brew install wakatime-cli
brew install zoxide
brew install gnu-sed # used for spectre

# wget https://github.com/arl/gitmux/releases/download/v0.7.10/gitmux_0.7.10_macOS_amd64.tar.gz
# unzip and move to /usr/local/bin/gitmux

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

# fisher https://github.com/jorgebucaran/fisher
# curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# fisher install FabioAntunes/fish-nvm edc/bass franciscolourenco/don
# chsh -s "$(which fish)"

fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/HEAD/functions/fisher.fish | source && \
  fisher install jorgebucaran/fisher && \
  fisher install FabioAntunes/fish-nvm edc/bass franciscolourenco/don && \
  chsh -s $(which fish) "
# cp "$HOME/.fzf/shell/key-bindings.fish" "$MYDIR/dotfiles/mackup/.config/fish/functions/fzf_key_bindings.fish"
# TODO: git remove mackup/.config/fish/functions/fzf_key_bindings.fish

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
   brew install --cask alfred           
   brew install --cask discord          
   # brew install --cask fantastical      
   # brew install --cask home-assistant   
   # brew install --cask obsidian         
   # brew install --cask postman          
   brew install --cask slack
   # brew install --cask spacelauncher    
   brew install --cask spotify
   brew install --cask sioyek
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
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
# apt install python3.8-venv

# dap
pip3 install debugpy
