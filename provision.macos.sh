
# this assumes the public key is created and uploaded to github
OMZ_REPO=git@github.com:kriwil/oh-my-zsh.git
WORKSPACE=$HOME/Workspace
DOTFILES_DIR=$WORKSPACE/dotfiles
DOTFILES_REPO=git@github.com:kriwil/dotfiles.git
NVIM_CONFIG=$HOME/.config/nvim

echo "... setup"
brew install zsh direnv curl git tmux hub neovim

echo "... dotfiles"
mkdir -p $DOTFILES_DIR
git clone $DOTFILES_REPO $DOTFILES_DIR
ln -s $DOTFILES_DIR/gitconfig $HOME/.gitconfig
ln -s $DOTFILES_DIR/gitignore_global $HOME/.gitignore_global
ln -s $DOTFILES_DIR/tmux.conf $HOME/.tmux.conf

echo "... zsh"
git clone $OMZ_REPO $HOME/.oh-my-zsh
ln -s $DOTFILES_DIR/zshrc.linux $HOME/.zshrc
sudo chsh -s `which zsh` $USER

echo "... vim"
# config
mkdir -p $NVIM_CONFIG
ln -s $DOTFILES_DIR/vimrc $HOME/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

