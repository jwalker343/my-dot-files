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

# LaTeX
sudo tlmgr install latexmk
sudo tlmgr install moderncv
sudo tlmgr install fontawesome

# Krew Kubectl Plugin Manager
set -x; cd "$(mktemp -d)" &&
curl -fsSLO "https://storage.googleapis.com/krew/v0.2.1/krew.{tar.gz,yaml}" &&
tar zxvf krew.tar.gz &&
./krew-"$(uname | tr '[:upper:]' '[:lower:]')_amd64" install \
    --manifest=krew.yaml --archive=krew.tar.gz

# Kubectl Plugins
kubectl krew install ingress-nginx
kubectl krew install view-secret
kubectl krew install tail
