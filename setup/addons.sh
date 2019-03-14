#!/bin/bash

# Install Addons
sudo gem install rubocop

#Initialize helm
helm init --client-only
helm plugin install https://github.com/databus23/helm-diff
