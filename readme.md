# Bash Configuration


### Install Homebrew
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install Tools
```
brew install thefuck            #Automatically Fix Errors
brew install tldr               #Shorter Man Pages
brew install z                  #Shortcut for recent Dirs
brew install gpg                #Encrypt all the things
brew install bash-completion    #Because lazy
brew install git                #Source Control
brew install git-crypt          #Encrypt files in git
brew install git-flow           #Better git methodoligies
brew install nmap               #Network scanning tool
brew install speedtest_cli      #Speed test from CLI
brew install kubectl            #Kubernetes
brew install ipcalc             #CLI IP/subnet calc
brew install telnet             #telnet client

```

### Install Applications

```bash
brew tap caskroom/cask                              #Cask can install applications
brew tap caskroom/versions                          #         And Older Versions
brew tap caskroom/fonts                             #         And Fonts

brew cask install docker                            #Containerization Software
brew cask install font-fira-code                    #Font with Ligatures
brew cask install microsoft-remote-desktop-beta     #Because Windows
brew cask install qlcolorcode                       #QuickLook Syntax Highlighting
brew cask install qlmarkdown                        #          Markdown files
brew cask install quicklook-json                    #          JSON Files
brew cask install quicklook-csv                     #          CSV Files
brew cask install qlstephen                         #          text files w/no ext
brew cask install cheatsheet                        #Hold Command to get Shortcuts
brew cask install epichrome                         #Make websites like apps
brew cask install firefox                           #Because safari sucks
brew cask install google-chrome                     #Because firefox sucks
brew cask install lastpass                          #Password Manager
brew cask install bettertouchtool                   #Customize mouse, keyboard, touchbar
brew cask install google-backup-and-sync            #Google Drive Replacement
brew cask install visual-studio-code-insiders       #Lightweight code editor
brew cask install chefdk                            #Chef, Knife toolset
brew cask install cisco-spark                       #Collaboration
brew cask install zterm                             #Cisco Console Connections
brew cask install xquartz                           #x11 forwarding thingy for mac
brew cask install java8                             #Unfortunately, java
brew cask install timing                            #Time Tracking App
brew cask install captain                           #(eval) container management menubar 
brew cask install kitematic                         #Think Client Container Management
brew cask install etcher                            #Bootable USB drive Maker
```

### Configure Environment
```bash
# Allow apps installed from anywhere
sudo spctl --master-disable

# Install Lastpass addons
open '/usr/local/Caskroom/lastpass/latest/LastPass Installer'

# make user directories
mkdir ~/Documents/git
mkdir ~/Documents/chef
mkdir ~/Documents/kube
mkdir ~/ssh_keys
ln -s ~/Documents/git ~/git
ln -s ~/Documents/chef ~/chef
ln -s ~/Documents/kube ~/kube

# Clone in this repo
cd ~/git
git clone https://github.com/jwalker343/my-dot-files.git

# Link up preference items
ln -s ~/git/my-dot-files/.profile ~/.profile
ln -s ~/git/my-dot-files/.gitignore_global ~/.gitignore_global
ln -s ~/git/my-dot-files/.gitconfig ~/.gitconfig

# install the login banner
sudo ./motd.sh

# Enable Sha1 for SSH & Pipe knownhost to /dev/null
# http://linuxcommando.blogspot.com/2008/10/how-to-disable-ssh-host-key-checking.html
mkdir ~/.ssh
echo -e "Host *" >> ~/.ssh/config
echo -e "\t StrictHostKeyChecking no" >> ~/.ssh/config
echo -e "\t UserKnownHostsFile=/dev/null" >> ~/.ssh/config
echo -e "\t KexAlgorithms +diffie-hellman-group1-sha1" >> ~/.ssh/config
```

# [Configure Preferences and Applications](application_preferences.md)
There are application preferences and mac preferences that cannot be scripted out this is where they are documented

# [Configure Peripherals](peripherals.md)
Peripherals like keyboard, mouse, printers, etc...

# Credit & Source
Shamelessly stolen from various online sources including but not limited to:
- https://natelandau.com/my-mac-osx-bash_profile/
- https://gist.github.com/natelandau/10654137
- http://www.spinen.com



