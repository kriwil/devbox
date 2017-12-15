#!/usr/bin/env bash
# ubuntu 16.04
apt-get update
apt-get install -y software-properties-common apt-transport-https ca-certificates curl
add-apt-repository ppa:neovim-ppa/stable

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get upgrade
apt-get install -y neovim tmux
# apt-get install -y docker-ce
