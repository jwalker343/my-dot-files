# Bash Configuration



```bash
# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# Install Tools

brew install thefuck
brew install tldr
brew install z
brew install bash-completion
brew install git
brew install git-crypt
brew install git-flow
brew install nmap
brew install speedtest_cli
brew install kubectl

```

```bash
# Install Applications

brew tap caskroom/cask

brew cask install docker
brew cask install microsoft-remote-desktop-beta
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install quicklook-csv
brew cask install qlstephen
brew cask install cheatsheet
brew cask install epichrome
brew cask install lastpass
brew cask install google-chrome
brew cask install bettertouchtool
brew cask install google-backup-and-sync

```

```bash
# Configure Environment

sudo ./motd.sh

mkdir ~/Documents/git
ln -s ~/Documents/git ~/git

cd ~/git
git clone https://github.com/jwalker343/my-dot-files.git


```

# Credit & Source
Shamelessly stolen from various online sources including but not limited to:
- https://natelandau.com/my-mac-osx-bash_profile/
- https://gist.github.com/natelandau/10654137
- http://www.spinen.com
