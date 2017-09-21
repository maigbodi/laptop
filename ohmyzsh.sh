# Install zsh as per documentation
fancy_echo "Installing zsh..."
brew install zsh zsh-completions

sudo chsh -s $(which zsh)

# Install oh-my-zsh as per documentation
fancy_echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Updating .zshrc with necessary rbenv setup and path variables
fancy_echo "Editing .zshrc..."
cat .zshrc > "$HOME/.zshrc"

# Installing custom oh-my-zsh theme
fancy_echo "Downloading custom zsh theme..."
cat sparta.zsh-theme > "$HOME/.oh-my-zsh/themes/sparta.zsh-theme"
