# Updating .zshrc with necessary rbenv setup and path variables
fancy_echo "Editing .zshrc..."
cat .zshrc > "$HOME/.zshrc"

# Installing custom oh-my-zsh theme
fancy_echo "Downloading custom zsh theme..."
cat sparta.zsh-theme > "$HOME/.oh-my-zsh/themes/sparta.zsh-theme"
