#!/bin/bash

MYDIR="$HOME/Workspace/Coding"
cd ~ && mkdir -p "$MYDIR" && cd "$MYDIR" || exit
git clone https://github.com/RebornHugo/dotfiles.git dotfiles

# for ssh clipboard
sudo apt install -y xclip
sudo apt install -y xsel

sudo apt install -y bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# sudo apt install fzf
cargo install lsd
pip3 install mackup
sudo apt install -y neofetch

# sudo apt install nodejs
# sudo apt install npm
# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# download and install Node.js
nvm install 20
# verifies the right Node.js version is in the environment
node -v # should print `v20.13.1`
# verifies the right NPM version is in the environment
npm -v # should print `10.5.2`
# npm install -g tree-sitter-cli
cargo install tree-sitter-cli

sudo apt install ripgrep
sudo apt install fd-find
curl -sS https://starship.rs/install.sh | sh
cargo install tealdeer
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
sudo apt install gnu-sed # used for spectre
sudo apt install so

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
export PATH="$PATH:/opt/nvim-linux64/bin"
rm nvim-linux64.tar.gz

# zap
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz

# golang
wget https://go.dev/dl/go1.22.3.linux-amd64.tar.gz
rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.3.linux-amd64.tar.gz

# lf
curl -L https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz | sudo tar xzC /usr/local/bin

# yq
wget https://github.com/mikefarah/yq/releases/download/v4.44.1/yq_linux_amd64.tar.gz
tar xf yq_linux_amd64.tar.gz
sudo mv yq_linux_amd64 /usr/local/bin/yq
rm yq_linux_amd64.tar.gz

# sudo sudo apt install golang-go -y
# export GO111MODULE=on
# env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf #@latest

# lsp related..
pip3 install debugpy

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
# "$(brew --prefix)"/opt/fzf/install --all
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sudo cp ~/.fzf/bin/fzf /usr/local/bin

# tmux tpm
echo "building tmux for ubuntu"
sudo apt remove -y tmux && sudo apt update -y && sudo apt install -y libncurses5-dev libncursesw5-dev
wget https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz && tar -zxf tmux-*.tar.gz
cd tmux-*/ || exit
./configure
make && sudo make install
cd "$MYDIR" || exit
/bin/rm tmux-3.3a.tar.gz

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# yq
# env CGO_ENABLED=0 go install github.com/mikefarah/yq/v4@latest

# env
echo "export PATH=$PATH:/opt/nvim-linux64/bin:/home/walle/.cargo/bin" >>/home/walle/Workspace/Coding/dotfiles/mackup/.zshenv
chmod +x /home/walle/Workspace/Coding/dotfiles/mackup/.config/bin/*

echo "
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
" >>/home/walle/Workspace/Coding/dotfiles/mackup/.zshenv
