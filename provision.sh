# this assumes the public key is created and uploaded to github
OMZ_REPO=git@github.com:kriwil/oh-my-zsh.git
WORKSPACE=$HOME/Workspace
DOTFILES_DIR=$WORKSPACE/dotfiles
DOTFILES_REPO=git@github.com:kriwil/dotfiles.git
NVIM_CONFIG=$HOME/.config/nvim

echo "... setup"
sudo apt-get update -y
sudo apt-get install -y zsh direnv curl git tmux

echo "... dotfiles"
mkdir -p $DOTFILES_DIR
git clone $DOTFILES_REPO $DOTFILES_DIR
ln -s $DOTFILES_DIR/gitconfig $HOME/.gitconfig
ln -s $DOTFILES_DIR/gitignore_global $HOME/.gitignore_global
ln -s $DOTFILES_DIR/tmux.conf $HOME/.tmux.remote.conf

echo "... zsh"
git clone $OMZ_REPO $HOME/.oh-my-zsh
ln -s $DOTFILES_DIR/zshrc.linux $HOME/.zshrc
sudo chsh -s `which zsh` $USER

echo "... asdf"
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.8.0

echo "... gh"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

echo "... vim"
# install
sudo apt-add-repository -y ppa:neovim-ppa/stable
sudo apt-get update -y
sudo apt-get install -y python3-dev python3-pip neovim

# config
mkdir -p $NVIM_CONFIG
ln -s $DOTFILES_DIR/vimrc $HOME/.config/nvim/init.vim
ln -s $DOTFILES_DIR/vimrc.python36 $HOME/.vimrc.python
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

