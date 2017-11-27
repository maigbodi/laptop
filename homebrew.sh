# Install Homebrew
fancy_echo "Installing Homebrew..."
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

# Update Homebrew
fancy_echo "Running brew update..."
brew update
green_echo "done."

fancy_echo "Tapping Brewfile and installing bundle..."
# Tap bre-bundle
brew tap Homebrew/bundle

# Install everything in Brewfile
brew bundle
green_echo "done."

# Clear Up
fancy_echo "Cleaning Up..."
brew prune
brew cleanup
brew cask cleanup
brew doctor
brew cask doctor

green_echo "Done with homebrew installs!"
