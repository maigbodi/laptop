echo "Installing Vim Plug..."

# Install vim-plug
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fancy_echo "Running VimPlug Commands..."

# Install plugins from .vimrc with vim-plug
vim :silent! +PlugInstall +qall
vim :silent! +PlugClean +qall
