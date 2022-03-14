#!/bin/bash

# Move to work directory
cd "$DOTFILE_GIT_DIRECTORY/my-dot-files/"

# Setup Standard Directory Structure
bash -c "./setup/directories.sh"

# Install Brew CLI apps
bash -c "./setup/brew.sh"

# Install GUI Apps from Brew
bash -c "./setup/casks.sh"

# Link up the dot files
bash -c "./setup/link-config-files.sh"

# setup SSH configuration
bash -c "./setup/ssh.sh"

# Setup Vim
bash -c "./setup/vim.sh"

# Setup motd header on terminals
bash -c "./setup/motd.sh"

# Configure OSX Settings
bash -c "./setup/macos.sh"

# Other configuration
bash -c "./setup/addons.sh"

# Setup ZSH
bash -c "./setup/zsh.sh"
