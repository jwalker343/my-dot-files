# Bash Configuration


### Install Homebrew
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install Tools
```
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

### Install Applications
```bash
brew tap caskroom/cask
brew tap caskroom/versions

brew cask install docker
brew cask install microsoft-remote-desktop-beta
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install quicklook-csv
brew cask install qlstephen
brew cask install cheatsheet
brew cask install epichrome
brew cask install firefox
brew cask install google-chrome
brew cask install lastpass
brew cask install bettertouchtool
brew cask install google-backup-and-sync
Brew cask install visual-studio-code-insiders

```

### Configure Environment
```bash
# Allow apps installed from anywhere
sudo spctl --master-disable

# Install Lastpass addons
open '/usr/local/Caskroom/lastpass/latest/LastPass Installer'

# make the git directories
mkdir ~/Documents/git
ln -s ~/Documents/git ~/git

# Clone in this repo
cd ~/git
git clone https://github.com/jwalker343/my-dot-files.git

# Link up items
ln -s ~/git/my-dot-files/.profile ~/.profile
ln -s ~/git/my-dot-files/.gitignore_global ~/.gitignore_global
ln -s ~/git/my-dot-files/.gitconfig ~/.gitconfig

# install the login banner
sudo ./motd.sh
```

# [Configure Preferences and Applications](application_preferences.md)
There are application preferences and mac preferences that cannot be scripted out this is where they are documented


# Credit & Source
Shamelessly stolen from various online sources including but not limited to:
- https://natelandau.com/my-mac-osx-bash_profile/
- https://gist.github.com/natelandau/10654137
- http://www.spinen.com
