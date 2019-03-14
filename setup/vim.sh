#!/bin/bash

# Create Vim Directory
cp -r ".vim" ~/

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Note
# .vimrc is linked with link-config-files.sh
