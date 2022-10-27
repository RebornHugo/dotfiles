#!/bin/bash

cd ~ && mkdir -p Workspace/Coding && cd Workspace/Coding 
git clone https://github.com/RebornHugo/dotfiles.git dotfiles

brew install bash
brew install bat
# brew install fd
brew install fish
brew install fzf
# brew install gh
brew install cmake
brew install git
# brew install git-delta
brew install lazydocker
brew install lazygit
brew install lf
brew install lsd
brew install mackup
brew install neofetch
brew install neovim
brew install ripgrep
brew install starship
brew install tealdeer
brew install tmux
# brew install wakatime-cli
brew install zoxide

# wget https://github.com/arl/gitmux/releases/download/v0.7.10/gitmux_0.7.10_macOS_amd64.tar.gz
# unzip and move to /usr/local/bin/gitmux

# brew tap clementtsang/bottom
# brew install bottom
# brew tap federico-terzi/espanso
# brew install espanso


if [[ $PLATFORM == 'macos' ]]; then
   brew install trash-cli
   brew install skhd
   brew services start skhd
   brew install yabai
   brew services start yabai
fi


# mackup
ln -s ~/Workspace/Coding/dotfiles/mackup/.mackup.cfg ~/.mackup.cfg
ln -s ~/Workspace/Coding/dotfiles/mackup/.mackup ~/.mackup
# ln -s /Users/hugoreborn/Workspace/Coding/dotfiles/mackup/.mackup.cfg /Users/hugoreborn/.mackup.cfg
mackup restore

# fisher https://github.com/jorgebucaran/fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install FabioAntunes/fish-nvm edc/bass franciscolourenco/don

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
if [[ $PLATFORM == 'macos' ]]; then
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
fi

# lsp
pip3 install black
pip3 install flake8
brew install shellcheck
npx @johnnymorganz/stylua-bin --help  # lua format still not work..
