# Install zsh as per documentation
fancy_echo "Installing zsh..."
brew install zsh zsh-completions

sudo chsh -s $(which zsh)

# Install oh-my-zsh as per documentation
fancy_echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
