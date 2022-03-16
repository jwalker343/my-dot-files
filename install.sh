#!/bin/bash

#
# Prompt for confirmation
#
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

#
# Get an Operating System so we can tailor the install
# 
echo "Please Select an Operating System:"
select os in darwin ubuntu
    do echo $os
    break
done

#
# Ask for the administrator password upfront
#
sudo -v

#
# Keep-alive: update existing `sudo` time stamp until we have finished
#
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#
# For MacOS, we need to complete the xcode install to get access to git.
#
if [ $os == "darwin" ]; then
    # Install Xcode Command Line Tools (includes git)
    sudo softwareupdate -i -a
    xcode-select --install

    # Finish the xcode Installation (GUI required)
    read -rsp $'Finish the xcode GUI install and then press any key to continue...\n' -n1 key
fi

#
# Clone in the repo so we can start executing stuff
#
cd; git clone "https://github.com/jwalker343/my-dot-files.git" "$DOTFILE_GIT_DIRECTORY/my-dot-files/"


#
# pre-config Complete, Start Executing the configuration
#


# Move to work directory
    cd "$DOTFILE_GIT_DIRECTORY/my-dot-files/"

# Setup Standard Directory Structure
    bash -c "./setup/directories.sh $os"

# Update & upgrade distro, install pre-req
    if [ $os == "ubuntu" ]; then
        bash -c "./setup/apt-get.sh"
    fi

# Install Brew CLI apps
    bash -c "./setup/brew.sh $os"

# Install GUI Apps from Brew
    if [ $os == "darwin" ]; then
        bash -c "./setup/casks.sh"
    fi

# Link up the dot files
    bash -c "./setup/link-config-files.sh"

# Setup Vim
    bash -c "./setup/vim.sh"

# Setup motd header on terminals
    bash -c "./setup/motd.sh $os"

# Configure OSX Settings
    if [ $os == "darwin" ]; then
        bash -c "./setup/macos.sh"
    fi

# Other configuration
    bash -c "./setup/addons.sh"

# Setup ZSH
    bash -c "./setup/zsh.sh $os"