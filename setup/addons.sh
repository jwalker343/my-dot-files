#!/bin/bash

# Setup Var
os=$1

# Activate Brew so that we can use 
# recently installed items before shell restart
if [ $os == "ubuntu" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ $os == "darwin" ]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

#Initialize helm
helm plugin install https://github.com/databus23/helm-diff

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm