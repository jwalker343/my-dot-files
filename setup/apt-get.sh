#!/bin/bash

# Update Apt-get
sudo apt-get update

# Upgrade the built-in packages
sudo apt-get upgrade -y

# Install Build essentials
sudo apt-get install build-essential -y

# Generate en_US.UTF-8 locale (referenced by LANG in .zshrc; without this,
# tools like git/perl fall back to C and print "Setting locale failed" warnings)
sudo apt-get install locales -y
sudo locale-gen en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8