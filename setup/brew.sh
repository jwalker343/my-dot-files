#!/bin/bash

# Setup Var
os=$1


# Install Brew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Activate Brew so we can use it
if [ $os == "ubuntu" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ $os == "darwin" ]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

# Install CLI tools from Brew

# GNU Tools
brew install bash                       # Update Bash
brew install coreutils                  # Common Tools (cat, ls, etc..)
brew install findutils                  # find, xargs, locate
brew install gawk                       # Awk
brew install gcc                        # C Compiler Update
brew install gnu-sed                    # Sed
brew install gnu-tar                    # Tar
brew install gnu-which                  # Which
brew install grep                       # Grep
brew install make                       # Update make
brew install wget                       # Wget

# General
brew install parallel                   # GNU Parallel / execute jobs in parallel
brew install tmux                       # Terminal Multiplexer
brew install watch                      # Watch a command output over time
brew install zsh                        # Better shell
brew install powerlevel10k              # Better zsh theme

# Developer
brew install git                        # Source Control
brew install cfssl                      # Cloudflare's PKI/TLS toolkit
brew install git-delta                  # Better diff/pager for GIT
brew install gh                         # GitHub CLI
brew install git-flow                   # Better git methodoligies
brew install jq                         # Process JSON files in bash
brew install yq                         # Process YAML files
brew install python@3.14                # Python Programming Language
brew install pyenv                      # Python Virtual Environments
brew install docker                     # Containers!

# Kubernetes
brew install kubernetes-cli             # Kubernetes
brew install helm                       # Kubernetes Helm Client
brew install helmfile                   # Declarative Helm Installations
brew install kubectx                    # Interactive kube context switching
brew install krew                       # Kubectl plugin manager

# Tech Tools
brew install ipcalc                     # CLI IP/subnet calc
brew install minicom                    # Better than Screen
brew install nmap                       # Network scanning tool
brew install speedtest_cli              # Speed test from CLI
brew install telnet                     # telnet client

# Cloud
brew install awscli                     # AWS Command Line Client

# Awesomeness
brew install fzf                        # fuzzy completion
brew install hr                         # <hr /> for terminal
brew install httpie                     # Curl but with colors!
brew install thefuck                    # Automatically Fix Errors
brew install tldr                       # Shorter Man Pages
brew install zoxide                     # Shortcut for recent Dirs
brew install lsd                        # Better ls
brew install pygments                   # Syntax Colorized needed by Zsh
