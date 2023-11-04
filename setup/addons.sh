#!/bin/bash

# Install Addons
sudo gem install colorls

#Initialize helm
helm plugin install https://github.com/databus23/helm-diff

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Go
go get golang.org/x/tools/cmd/godoc
go get -u golang.org/x/lint/golint