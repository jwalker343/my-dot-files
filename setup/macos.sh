#!/bin/bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# System Preferences

# =============================================================================
# General
# =============================================================================

# Enable dark mode, even it it's already enabled
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

# Set Highlight color to green
osascript -e 'tell application "System Events" to tell appearance preferences to set highlight color to {46447, 63569, 40411}'

# Enable scroll bars automatically based on trackpad/mouse
defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# Disable "resume apps" system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Allow apps installed from anywhere
sudo spctl --master-disable