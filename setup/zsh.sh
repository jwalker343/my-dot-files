#!/bin/bash

# Setup Var
os=$1

# Install Oh My Zsh
ZSH=~/git/oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Link Custom Configs to ZSH
rm -rf ~/git/oh-my-zsh/custom/plugins/my-aliases
rm -rf ~/git/oh-my-zsh/custom/plugins/auto-color-ls
rm -f ~/.zshrc

ln -s ~/git/my-dot-files/zsh-plugins/my-aliases/ ~/git/oh-my-zsh/custom/plugins/my-aliases;
ln -s ~/git/my-dot-files/zsh-plugins/auto-color-ls/ ~/git/oh-my-zsh/custom/plugins/auto-color-ls;
ln -s ~/git/my-dot-files/.zshrc ~/.zshrc

# Clone in custom plugins:
git clone https://github.com/zsh-users/zsh-autosuggestions ~/git/oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/git/oh-my-zsh/custom/plugins/zsh-autocomplete

# For Ubuntu, we must set zsh as the default shell
if [ $os == "ubuntu" ]; then
  echo $(which zsh) | sudo tee -a /etc/shells
  chsh -s $(which zsh)
fi