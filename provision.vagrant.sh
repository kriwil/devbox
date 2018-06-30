#!/usr/bin/env bash
USER=$1

# ubuntu 16.04
apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    direnv \
    python3 \
    python3-pip \
    software-properties-common \
    tmux \
    zsh

# go
add-apt-repository -y ppa:longsleep/golang-backports

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# neovim
add-apt-repository -y ppa:neovim-ppa/stable

apt-get update
apt-get install -y docker neovim golang-go

apt-get -y upgrade

chsh -s /usr/bin/zsh ubuntu

su $USER -c 'ln -s /home/ubuntu/dotfiles/zshrc.linux /home/$USER/.zshrc'
su $USER -c 'ln -s /home/ubuntu/dotfiles/tmux.conf /home/$USER/.tmux.conf'

# git & friends
su $USER -c 'go get -u github.com/github/hub'
su $USER -c 'go get -u github.com/zaquestion/lab'

