#!/bin/bash

# Prompt for confirmation
while true; do
    echo
    echo "Dot Files will be cloned into \"$DOTFILE_GIT_DIRECTORY/my-dot-files/\""
    read -p "Do you wish to install the dot-files? (Y/N)" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes (y) or no (n).";;
    esac
done

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Xcode Command Line Tools (includes git)
sudo softwareupdate -i -a
xcode-select --install

read -rsp $'Finish the xcode GUI install and then press any key to continue...\n' -n1 key

# Clone in the repo and execute bootstrap
cd; git clone "https://github.com/jwalker343/my-dot-files.git" "$DOTFILE_GIT_DIRECTORY/my-dot-files/"
bash -c "$DOTFILE_GIT_DIRECTORY/my-dot-files/bootstrap.sh"
