#!/bin/bash

# Setup Var
os=$1
script_dir="$(cd "$(dirname "$0")" && pwd)"

# Every branch overwrites /etc/motd (never appends), so re-running is safe.
if [[ $os == "darwin" ]]; then
  # Rainbow Apple (braille, traced from the SVG) + WALKER wordmark; needs >= 79 columns
  sudo install -m 644 "$script_dir/motd-darwin.ansi" /etc/motd
elif [[ $os == "ubuntu" ]]; then
  # 2004 Circle of Friends (braille, traced from the SVG) + WALKER wordmark; needs >= 80 columns
  sudo install -m 644 "$script_dir/motd-ubuntu.ansi" /etc/motd
fi
