#!/bin/bash

# make user directories
mkdir -p ~/Documents/kube
mkdir -p ~/ssh_keys
mkdir -p ~/.ssh
mkdir -p ~/.config/
mkdir -p ~/.config/lsd
mkdir -p ~/.config/delta

# Link directories to shortcuts
ln -s ~/Documents/git ~/git
ln -s ~/Documents/kube ~/kube
