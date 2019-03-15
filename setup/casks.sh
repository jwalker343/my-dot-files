#!/bin/bash

# Taps
brew tap caskroom/cask                              # Cask can install applications
brew tap caskroom/versions                          # Cask can install Older Versions
brew tap caskroom/fonts                             # Cask can install Fonts
brew tap chef/chef                                  # Chefdk is hosted on a seperate tap

# Browsers
brew cask install firefox                           # Because safari sucks
brew cask install google-chrome                     # Because firefox sucks
brew cask install epichrome                         # Make websites like apps

# Docker
brew cask install docker                            # Containerization Software
brew cask install captain                           # (eval) container management menubar 
brew cask install kitematic                         # Think Client Container Management

# QuickLooks
brew cask install qlcolorcode                       # Syntax Highlighting
brew cask install qlmarkdown                        # Markdown files
brew cask install qlstephen                         # Text files w/no ext
brew cask install quicklook-csv                     # CSV Files
brew cask install quicklook-json                    # JSON Files

# General
brew cask install azure-data-studio                 # Like MySQL Workbench for sql servers
brew cask install google-cloud-sdk                  # gcloud SDK
brew cask install angry-ip-scanner                  # Scan Local IP Networks
brew cask install balenaetcher                      # Bootable USB drive Maker
brew cask install bettertouchtool                   # Customize mouse, keyboard, touchbar
brew cask install caffeine                          # Keeps your screen awake
brew cask install cheatsheet                        # Hold Command to get Shortcuts
brew cask install chefdk                            # Chef, Knife toolset
brew cask install webex-teams                       # Collaboration & Messaging
brew cask install font-fira-code                    # Font with Ligatures
brew cask install google-backup-and-sync            # Google Drive Replacement
brew cask install java8                             # Unfortunately, java
brew cask install kaleidoscope                      # Diff tool
brew cask install microsoft-remote-desktop-beta     # Because Windows
brew cask install mysqlworkbench                    # Manage MySQL Servers
brew cask install skitch                            # Capture & Annotate your screen
brew cask install spotify                           # Amazing Music
brew cask install timing                            # Time Tracking App
brew cask install visual-studio-code-insiders       # code editor
brew cask install xquartz                           # x11 forwarding thingy for mac
brew cask install zterm                             # Cisco Console Connections
