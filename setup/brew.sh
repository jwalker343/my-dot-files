#!/bin/bash

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install CLI tools from Brew

# GNU Tools
brew install bash                       # Update Bash
brew install coreutils                  # Common Tools (cat, ls, etc..)
brew install findutils                  # find, xargs, locate
brew install gawk                       # Awk
brew install gnu-sed                    # Sed
brew install gnu-tar                    # Tar
brew install gnu-which                  # Which
brew install grep                       # Grep
brew install make                       # Update make
brew install wget                       # Wget

# General
brew install bash-completion            # Because lazy
brew install gpg                        # Encrypt all the things
brew install parallel                   # GNU Parallel / execute jobs in parallel
brew install tmux                       # Terminal Multiplexer
brew install watch                      # Watch a command output over time

# Developer
brew install git                        # Source Control
brew install cfssl                      # Cloudflare's PKI/TLS toolkit
brew install composer                   # PHP Package Management
brew install diff-so-fancy              # Better diff tolls for GIT
brew install git-crypt                  # Encrypt files in git
brew install git-flow                   # Better git methodoligies
brew install go                         # Go Programming Language
brew install jq                         # Process JSON files in bash
brew install node                       # node
brew install php72                      # Update PHP to version 7.2
brew install shellcheck                 # Lint bash scripts
brew install yarn                       # yarn for node

# Kubernetes
brew install kubernetes-cli             # Kubernetes
brew install kubernetes-helm            # Kubernetes Helm Client
brew install helmfile                   # Declarative Helm Installations
brew install kubectx                    # Interactive kube context switching
brew install kustomize                  # Structured kubernetes yaml files

# Tech Tools
brew install ipcalc                     # CLI IP/subnet calc
brew install nmap                       # Network scanning tool
brew install speedtest_cli              # Speed test from CLI
brew install telnet                     # telnet client

# Cloud
brew install awscli                     # AWS Command Line Client
brew install azure-cli                  # Azure Command Line Client

# Awesomeness
brew install fzf                        # fuzzy completion
brew install hr                         # <hr /> for terminal
brew install httpie                     # Curl but with colors!
brew install thefuck                    # Automatically Fix Errors
brew install tldr                       # Shorter Man Pages
brew install z                          # Shortcut for recent Dirs
