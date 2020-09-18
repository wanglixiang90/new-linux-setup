#! /bin/bash

sudo apt update
sudo apt upgrade

sudo apt install wget curl gcc git make xclip vim fonts-powerline zsh neovim tmux rename build-essential


# Set up Git
git config --global core.eol lf           # Git changes line-endings to Linux when needed
git config --global core.autocrlf input   # Automatically convert line-endings to Linux on commit


# Set up Neovim
mkdir -p ~/.config/nvim
mv ./init.vim ~/.config/nvim/init.vim
# dein plugin manager
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm ./installer.sh
# Install plugins
nvim -c 'call dein#install()'


# zsh setup
# Trigger zsh first time user setup.
zsh -v
# Set zsh as default terminal
chsh -s /bin/zsh
# Get directory colors
cd ~ && curl -o ~/dircolors.256dark https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark && cd -
# zsh config
echo "PS2='> '"						| tee -a ~/.bashrc ~/.zshrc
echo "alias c='clear'"		| tee -a ~/.bashrc ~/.zshrc
echo "alias lsa='ls -a'"	| tee -a ~/.bashrc ~/.zshrc
echo "alias t='tmux'"			| tee -a ~/.bashrc ~/.zshrc
echo "eval \`dircolors ~/dircolors.256dark\`" | tee -a ~/.bashrc ~/.zshrc
# Check if powerline-fonts for agnoster are installed correctly
echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"


# tmux setup
# oh-my-tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf -t ~
cp ~/.tmux/.tmux.conf.local ~
# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-sensible ~/.tmux/plugins/tmux-sensible
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect


# Set up nodenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
cd ~/.nodenv && src/configure && make -C src
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' | tee -a ~/.bashrc ~/.zshrc
echo 'eval "$(nodenv init -)"' | tee -a ~/.bashrc ~/.zshrc
# Install nodenv-build - to be able to install node versions
mkdir -p "$(nodenv root)"/plugins
git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
# Test if nodenv is set up correctly
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash


# Set up 
mkdir ~/scripts
# mv ./s ./take ~/scripts/
mv ./s ~/scripts/
sudo chmod +x ~/scripts/*
ln -s ~/scripts/s /bin
ln -s ~/scripts/take /bin


## Do manually
## Set ZSH_THEME="agnoster"


## Add github SSH keys
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/github_id_rsa
# xclip -sel clip < ~/.ssh/github_id_rsa.pub
## Test github connection
# ssh -T git@github.com
