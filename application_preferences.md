# Configure Preferences and Applications

## Mac System Preferences
[x-apple.systempreferences:com.apple.preference.universalaccess](x-apple.systempreferences:com.apple.preference.universalaccess)



Sign into apple ID for app-store and install the following apps:
Accept the usage for Numbers,Keynote,pages,etc...
Sonicwall mobile connect
Xcode
Skitch
Monosnap
Open Xcode and agree to terms
Complete the Readme here: https://github.com/jwalker343/my-dot-files
 
 
Install other web-based apps:
Anyconnect
Configure Epichrome with:
secret server
Connectwise
Nable
 
Configure BetterTouchTools
Keyboard Shortcut, Add, Command+L is lock
Keyboard shortcut, Add Command+K send to finder
(you'll need to add a shortcut for Shift+K first, then set finder (don't switch) and then change the trigger command
Settings > Launch at start
 
Configure:
Google Chrome
Lastpass
Google Backup and Sync
Better Touch Tool License
preferences
 
 
VPN show time connected
Battery Show percent


General
Use Dark Menu
Highlight Color: GREEN
Scroll Bars Automatic
Close Windows when quitting an App
Display
Uncheck auto adjust for display brightness
Select "Scaled" For More Space 
Desktop
Change automatically every 5 minutes
random order
Folder > Google Drive > Wallpapers
Screen Saver
Ken Burns > Folder > Google Drive > Wallpapers
Dock
Size 33%
Magnification 75%
Position Left
Minimize using Scale
Animate Opening
Auto Hide and Show
Show indicators for open apps
Mission Control
uncheck auto rearrange spaces based on usage
dashboard = off
Security and Privacy
Require pass after 5 minutes
show message: "This Computer is Locked."
Allow apps from anywhere
Privacy / Do not send diagnostic or crash data
Spotlight
uncheck music movies fonts
make sure search shortcut is cmd+Space
Energy Saver
battery / display off after 3 minutes
battery / sleep hard disks when possible
battery / slightly dim
Power / Display off 3 hours
Power / Sleep hard disks when possible
Power / Wake for Wi-Fi network access
Power / Enable power nap
Keyboard
Key Repeat is Fastest
delay is short
Shortcuts
-remove show desktop and dashboard
Trackpad
Uncheck Scroll Direction Natural
Swipe between full-screen apps = 4 fingers
Mission Control = 4 fingers
App Exposé = 4 fingers
uncheck launchpad gesture
Sound
Play Feedback when volume is changed
Accessibility
Zoom > Use scroll gesture with modifier keys to zoom (Control Key.)
bluetooth
show bluetooth in menu bar
Update Finder
new Finder windows should point to $profile
Don't show tags
sidebar
remove
-all my files
-icloud
-back to my mac
-bonjour
add
-$profile
-Hard Disks
-add Git & Chef folder symlinks
 
Terminal
Clone and setup the dot-files from git-lab
We need to symlink in the gitignore_global and .profile files to ~
we also need to edit .profile and comment out anything about java and rbenv at the bottom
We need to add the terminal profile and set it as default
brew install bash-completion
 
chmod +x $(brew --prefix)/etc/bash_completion
redirect ssh known_host to /dev/nul http://linuxcommando.blogspot.com/2008/10/how-to-disable-ssh-host-key-checking.html