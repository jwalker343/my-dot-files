#!/bin/bash

# Install Addons
sudo gem install rubocop
helm plugin install https://github.com/databus23/helm-diff

# Install Lastpass addons
open '/usr/local/Caskroom/lastpass/latest/LastPass Installer'
