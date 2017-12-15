#!/usr/bin/env bash
# ubuntu 16.04
apt-get update
apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	python3 \
	python3-pip \
	software-properties-common \
	tmux \
	zsh

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# neovim
add-apt-repository ppa:neovim-ppa/stable

apt-get update
apt-get install -y docker neovim

apt-get upgrade

chsh -s /usr/bin/zsh