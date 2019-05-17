#!/bin/bash

# Install Addons
sudo gem install rubocop

#Initialize helm
helm init --client-only
helm plugin install https://github.com/databus23/helm-diff

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Go
go get golang.org/x/tools/cmd/godoc
go get -u golang.org/x/lint/golint