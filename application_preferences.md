# Configure Preferences and Applications

### App Store
Sign into apple ID for app-store and install the following apps:
- Accept the usage for Numbers,Keynote,pages,etc...
- Sonicwall mobile connect
- Xcode
- Skitch
- Monosnap
- Open Xcode and agree to terms



# Mac System Preferences
**General**
- Use Dark Menu
- Highlight Color: GREEN
- Scroll Bars Automatic
- Close Windows when quitting an App

**Display**
- Uncheck auto adjust for display brightness
- Select "Scaled" For More Space 

**Desktop**
- Change automatically every 5 minutes
- random order
- Folder > Google Drive > Wallpapers

**Screen Saver**
- Ken Burns > Folder > Google Drive > Wallpapers

**Dock**
- Size 33%
- Magnification 75%
- Position Left
- Minimize using Scale
- Animate Opening
- Auto Hide and Show
- Show indicators for open apps

**Mission Control**
- uncheck auto rearrange spaces based on usage
- dashboard = off

**Security and Privacy**
- Require pass after 5 minutes
- show message: "This Computer is Locked."
- Allow apps from anywhere
- Privacy
    - Analytics
        - Don't send
    - Accessibility
        - allow BetterTouchTools
        - allow Cheatsheet

**Spotlight**
- uncheck music movies fonts
- make sure search shortcut is cmd+Space

**Energy Saver**
- Battery
    - display off after 3 minutes
    - sleep hard disks when possible
    - slightly dim
- Power
    - Display off 3 hours
    - Sleep hard disks when possible
    - Wake for Wi-Fi network access
    - Enable power nap

**Keyboard**
- Key Repeat is Fastest
- delay is short
- Shortcuts
    - remove show desktop and dashboard

**Trackpad**
- Uncheck Scroll Direction Natural
- Swipe between full-screen apps = 4 fingers
- Mission Control = 4 fingers
- App Exposé = 4 fingers
- uncheck launchpad gesture

**Date & Time**
- display the time with seconds
- Show day of the week

**Sound**
- Play Feedback when volume is changed

**Accessibility**
- Zoom > Use scroll gesture with modifier keys to zoom (Control Key.)

**bluetooth**
- show bluetooth in menu bar

# Application Preferences

**Finder**
- new Finder windows should point to $profile
- Don't show tags
- sidebar / uncheck
    - Recents
    - iCloud Drive
    - Back to my Mac
    - Bonjour Computers
    - Tags
- sidebar / Check these
    - Airdrop
    - Applications
    - Desktop
    - Documents
    - Downloads
    - $Profile
    - Connected Servers
    - Hard Disks
    - External Disks
    - CDs
- Open Finder and Drag the git folder to the left bar
 
### Configure BetterTouchTools
- Install license
- Advanced Settings
    - Launch at startup
    - uncheck show menu bar
- Disable SnapAreas feature
- Use Fn to move windows
- Gestures
    - Keyboard Shortcut, Add, Command+L is lock
    - Keyboard shortcut, Add Command+K send to finder (follow instructions)
        - add a new shortcut, with Shift+K
        - Trigger Other Keyboard Shortcut CMD+K
        - Action: send shortcut to app, search for finder
        - change shortcut keys to CMD+K
    - Touchbar > Add Lock Icon with action to lock screen

# UI Preferences
- Create a new IPSec VPN
    - Show VPN Status in the Menu Bar
- Click the VPN dropdown in the menu bar
    - Show Time Connected
- Click the battery and choose Show percentage
- Make the dock contain:
    - Finder
    - Chrome
    - Secret Server
    - Connectwise
    - N-able
    - Code
    - Outlook
    - Spark
    - (spacer)
    - Trashcan

### Configure Epichrome with:
- secret server
    - Install Lastpass Addon & epichrome Helper
    - Install Secret Server Clipboard Utility
- Connectwise
    - Install Lastpass Addon & epichrome Helper
- Nable
    - Install LastPass Addon & epichrome Helper
    - Download/Install MSPA Viewer

# Other Apps that need to be installed
- Anyconnect 
- GoToAssist Expert [http://www.fastsupport.com/download/repDownload](Here)
- Microsoft Office 2016 [http://login.microsoftonline.com](Here)

### Configure:
- Docker
- FireFox
    - Lastpass: Enable Addon
- Google Chrome
    - Lastpass: Enable addon
    - Sign in to chrome
    - enter encryption passphrase (hint it's: ***********)
    - Pushbullet: signin & then configure encryption key
- Microsoft RDP Beta
    - User Accounts: Add your account
    - Change to list view
    - Import Desktops
- Monosnap
    - Configure S3 settings
- Terminal
    - Import base16-Dark.terminal
    - Set base15-Dark as the default
    - Set new windows to open with base16-dark
- Google Backup and Sync
- Visual Studio Code Settings Sync
- Microsoft Office
    - Open Word and sign in to activate
    - Open Excel/PowerPoint/OneNote and accept initialization
    - Open Outlook and add exchange
    - Always trust the SSL redirect error



redirect ssh known_host to /dev/nul http://linuxcommando.blogspot.com/2008/10/how-to-disable-ssh-host-key-checking.html