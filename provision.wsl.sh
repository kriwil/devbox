#!/bin/sh
# this assumes the public key is created and uploaded to github
OMZ_REPO=git@github.com:kriwil/oh-my-zsh.git
WORKSPACE=$HOME/Workspace
DOTFILES_DIR=$WORKSPACE/dotfiles
DOTFILES_REPO=git@github.com:kriwil/dotfiles.git
NVIM_CONFIG=$HOME/.config/nvim

echo "dotfiles"
mkdir -p $DOTFILES_DIR
git clone $DOTFILES_REPO $DOTFILES_DIR
ln -s $DOTFILES_DIR/gitconfig $HOME/.gitconfig
ln -s $DOTFILES_DIR/gitignore_global $HOME/.gitignore_global
ln -s $DOTFILES_DIR/tmux.conf $HOME/.tmux.conf

echo "zsh"
sudo apt-get update -y
sudo apt-get install -y zsh direnv
git clone $OMZ_REPO $HOME/.oh-my-zsh
ln -s $DOTFILES_DIR/zshrc.wsl $HOME/.zshrc
sudo chsh -s `which zsh` $USER

echo "vim"
# install
sudo apt-add-repository -y ppa:neovim-ppa/stable
sudo apt-get update -y
sudo apt-get install -y python-dev python-pip python3-dev python3-pip neovim
# config
mkdir -p $NVIM_CONFIG
ln -s $DOTFILES_DIR/vimrc $HOME/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "python"
sudo add-apt-repository -y ppa:jonathonf/python-3.6
sudo apt-get update -y
sudo apt-get install -y python3.6

echo "docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce
# Allow your user to access the Docker CLI without needing root.
sudo usermod -aG docker $USER

# Install Docker Compose.
DOCKER_COMPOSE_VERSION=1.21.2 sudo curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose