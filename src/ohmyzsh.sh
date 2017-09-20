fancy_echo "Installing zsh..."
brew install zsh zsh-completions

chsh -s $(which zsh)

fancy_echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

fancy_echo "Downloading custom zsh theme..."

cat sparta.zsh-theme > "$HOME/.oh-my-zsh/themes/sparta.zsh-theme"

fancy_echo "Editing .zshrc..."

cat .zshrc > "$HOME/.zshrc"
