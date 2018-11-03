WORKSPACE=$HOME/Workspace
DOTFILES_DIR=$WORKSPACE/dotfiles
NVIM_CONFIG=$HOME/.config/nvim

# sudo apt-add-repository -y ppa:neovim-ppa/stable
# sudo apt-get update -y
# sudo apt-get install -y python-dev python-pip python3-dev python3-pip neovim python3-neovim python-neovim

mkdir -p $NVIM_CONFIG
ln -s $DOTFILES_DIR/vimrc $HOME/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

