#!/bin/bash

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install CLI tools from Brew

# General
brew install gpg                        # Encrypt all the things
brew install bash-completion            # Because lazy
brew install watch                      # Watch a command output over time
brew install parallel                   # GNU Parallel / execute jobs in parallel

# Developer
brew install git                        # Source Control
brew install git-crypt                  # Encrypt files in git
brew install git-flow                   # Better git methodoligies
brew install diff-so-fancy              # Better diff tolls for GIT
brew install node                       # node
brew install yarn                       # yarn for node
brew install jq                         # Process JSON files in bash

# Kubernetes
brew install kubernetes-cli             # Kubernetes
brew install kubernetes-helm            # Kubernetes Helm Client
brew install helmfile                   # Declarative Helm Installations
brew install kustomize                  # Structured kubernetes yaml files
brew install kubectx                    # Interactive kube context switching

# Tech Tools
brew install nmap                       # Network scanning tool
brew install speedtest_cli              # Speed test from CLI
brew install ipcalc                     # CLI IP/subnet calc
brew install telnet                     # telnet client

# Cloud
brew install azure-cli                  # Azure Command Line Client
brew install awscli                     # AWS Command Line Client

# Awesomeness
brew install thefuck                    # Automatically Fix Errors
brew install tldr                       # Shorter Man Pages
brew install z                          # Shortcut for recent Dirs
brew install hr                         # <hr /> for terminal
brew install httpie                     # Curl but with colors!
brew install fzf                        # fuzzy completion
