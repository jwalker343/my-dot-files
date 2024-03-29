#!/bin/bash

# Link Files
ln -s ~/git/my-dot-files/.gitignore_global ~/.gitignore_global
ln -s ~/git/my-dot-files/.gitconfig ~/.gitconfig
ln -s ~/git/my-dot-files/.inputrc ~/.inputrc
ln -s ~/git/my-dot-files/.vimrc ~/.vimrc
ln -s ~/git/my-dot-files/.tmux.conf ~/.tmux.conf
ln -s ~/git/my-dot-files/.ssh-config ~/.ssh/config
ln -s ~/git/my-dot-files/.p10k.zsh ~/.p10k.zsh
ln -s ~/git/my-dot-files/lsd-config.yaml ~/.config/lsd/config.yaml

# bug -- must by copied
cp ~/git/my-dot-files/.finicky.js ~/.finicky.js