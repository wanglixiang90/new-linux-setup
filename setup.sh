#! /bin/bash

sudo apt update
sudo apt upgrade

sudo apt install wget curl gcc git make xclip vim fonts-powerline zsh

# Set up Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Trigger zsh first time user setup.
zsh -v

# Set zsh as default terminal
chsh -s /bin/zsh
# Set aliases
echo "alias c='clear'" >> ~/.zshrc
# Check if powerline-fonts for agnoster are installed correctly
echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"

# Set up nodenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
cd ~/.nodenv && src/configure && make -C src
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(nodenv init -)"' >> ~/.zshrc
# Install nodenv-build - to be able to install node versions
mkdir -p "$(nodenv root)"/plugins
git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
# Test if nodenv is set up correctly
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash

## Do manually
## Set ZSH_THEME="agnoster"

## Add github SSH keys
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/github_id_rsa
# xclip -sel clip < ~/.ssh/github_id_rsa.pub
## Test github connection
# ssh -T git@github.com
