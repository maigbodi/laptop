# Clone down dotfiles
fancy_echo "Installing dotfiles..."
cd $HOME
curl -O https://raw.githubusercontent.com/spartaglobal/laptop/master/assets/dotfiles/.bash_profile
curl -O https://raw.githubusercontent.com/spartaglobal/laptop/master/assets/dotfiles/.vimrc
curl -O https://raw.githubusercontent.com/spartaglobal/laptop/master/assets/dotfiles/.pryrc
curl -O https://raw.githubusercontent.com/spartaglobal/laptop/master/assets/dotfiles/.irbrc
curl -O https://raw.githubusercontent.com/spartaglobal/laptop/master/assets/dotfiles/.gitconfig
curl -O https://raw.githubusercontent.com/spartaglobal/laptop/master/assets/dotfiles/.git_status_in_prompt.sh
echo "gem: --no-document" > $HOME/.gemrc
cd $LAPTOP_INSTALL_DIR
fancy_echo "dotfiles done!"
