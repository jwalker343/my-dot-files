#!/bin/bash

# Link Files
ln -s ~/git/my-dot-files/.gitignore_global ~/.gitignore_global
ln -s ~/git/my-dot-files/.gitconfig ~/.gitconfig
ln -s ~/git/my-dot-files/.inputrc ~/.inputrc
ln -s ~/git/my-dot-files/.vimrc ~/.vimrc
ln -s ~/git/my-dot-files/.tmux.conf ~/.tmux.conf
ln -s ~/git/my-dot-files/.ssh-config ~/.ssh/config
ln -s ~/git/my-dot-files/.p10k.zsh ~/.p10k.zsh
ln -s ~/git/my-dot-files/lsd-config.yaml ~/.config/lsd/config.yaml
ln -s ~/git/my-dot-files/delta-themes.gitconfig ~/.config/delta/themes.gitconfig

# Per-machine git identity (never tracked in the repo)
if [ ! -f ~/.gitconfig.local ]; then
    echo
    echo "No ~/.gitconfig.local found -- set the git identity for this machine."
    read -p "Git user.name: " git_user_name
    read -p "Git user.email: " git_user_email
    cat > ~/.gitconfig.local <<EOF
[user]
	name = $git_user_name
	email = $git_user_email
EOF
fi

# Per-repo override -- use personal identity/key for this repo on a work machine
DOTFILES_REPO=~/git/my-dot-files
echo
read -p "Should we set git repo override for username, email and ssh key? (Work machine?) (y/N) " override
if [[ $override == [Yy]* ]]; then
    read -p "Git user.name  [Johnny Walker]: " ov_name
    read -p "Git user.email [jwalker3437@gmail.com]: " ov_email
    read -p "SSH key path   [~/.ssh/id_personal]: " ov_key

    git -C "$DOTFILES_REPO" config --local user.name  "${ov_name:-Johnny Walker}"
    git -C "$DOTFILES_REPO" config --local user.email "${ov_email:-jwalker3437@gmail.com}"
    git -C "$DOTFILES_REPO" config --local core.sshCommand \
        "ssh -i ${ov_key:-~/.ssh/id_personal} -o IdentitiesOnly=yes"

    echo "Repo override set. Verify with: git -C $DOTFILES_REPO config --local --list"
fi
