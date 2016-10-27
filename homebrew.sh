
# Install Homebrew
if [ ! -d "$HOME/.bin/" ]; then
  fancy_echo "Creating ~/.bin folder..."
  mkdir "$HOME/.bin"
fi

HOMEBREW_PREFIX="/usr/local"

if [ -d "$HOMEBREW_PREFIX" ]; then
  green_echo "Chowning $HOMEBREW_PREFIX to \"$LOGNAME:admin\"..."
  echo $passwd | sudo -S chown -R "$LOGNAME:admin" "$HOMEBREW_PREFIX"
else
  echo $passwd | sudo -S -k mkdir "$HOMEBREW_PREFIX"
  echo $passwd | sudo -S -k chflags norestricted "$HOMEBREW_PREFIX"
  echo $passwd | sudo -S chown -R "$LOGNAME:admin" "$HOMEBREW_PREFIX"
fi

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    export PATH="/usr/local/bin:$PATH"
fi

if brew list | grep -Fq brew-cask; then
  fancy_echo "Uninstalling old Homebrew-Cask..."
  brew uninstall --force brew-cask
  brew cleanup
  brew cask cleanup
fi

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
green_echo "done."

green_echo "Done with homebrew installs!"
