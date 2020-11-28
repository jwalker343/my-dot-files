# Update Packages
sudo apt-get update

# Upgrade installed packages
sudo apt-get upgrade -y

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Homebrew dependencies
sudo apt-get install build-essential gcc -y
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Install CLI tools from Brew

#GNU Tools/Core Tools
brew install make

# General
brew install tmux
brew install parallel

# Developer
brew install cfssl                      # Cloudflare's PKI/TLS toolkit
brew install composer                   # PHP Package Management
brew install diff-so-fancy              # Better diff tolls for GIT
brew install git-crypt                  # Encrypt files in git
brew install git-flow                   # Better git methodoligies
brew install go                         # Go Programming Language
brew install jq                         # Process JSON files in bash
brew install node                       # Node
brew install php72                      # Update PHP to version 7.2
brew install shellcheck                 # Lint bash scripts
brew install yarn                       # yarn for node
brew install ruby                       # Ruby 

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

# Docker
brew install docker                     # Containerization software
brew install docker-compose             # Managed container files

# Chef
sudo curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable



#
# Addons
#

# Rubcop style checking
gem install rubocop

# install helm-diff plugin
helm plugin install https://github.com/databus23/helm-diff

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install godoc and golint
go get golang.org/x/tools/cmd/godoc
go get -u golang.org/x/lint/golint



#
# Directories
#

mkdir -p ~/git
mkdir -p ~/ssh_keys
mkdir -p ~/kube
