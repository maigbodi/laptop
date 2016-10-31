# Install MySQL Workbench
fancy_echo "Installing MySQL Workbench..."
temp=$TMPDIR$(uuidgen)
mkdir -p $temp/mount
curl -s http://cdn.mysql.com//Downloads/MySQLGUITools/mysql-workbench-community-6.3.7-osx-x86_64.dmg > $temp/1.dmg
yes | hdiutil attach -noverify -nobrowse -mountpoint $temp/mount $temp/1.dmg
cp -r $temp/mount/*.app /Applications
hdiutil detach $temp/mount
rm -rf $temp

# Install tccutil and add terminal to list of allowed assistive devices
curl -O https://raw.githubusercontent.com/jacobsalmela/tccutil/master/tccutil.py
sudo python ./tccutil.py --verbose --insert com.apple.Terminal


# Desktop Background
fancy_echo "Setting desktop background..."
curl https://raw.githubusercontent.com/spartaglobal/laptop/master/assets/avatar.jpg > "$HOME/Pictures/avatar.jpg"
curl https://raw.githubusercontent.com/spartaglobal/laptop/master/assets/desktop-bg.png > "$HOME/Pictures/desktop-bg.png"
osascript <<EOD
  tell application "Finder"
    set desktop picture to "$HOME/Pictures/desktop-bg.png" as POSIX file
  end tell
EOD

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Set faster Key Repeat
defaults write -g KeyRepeat -int 0

# Disable press-and-hold and enable KeyRepeat instead
defaults write -g ApplePressAndHoldEnabled -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Profile Picture
fancy_echo "Setting user avatar..."
echo "0x0A 0x5C 0x3A 0x2C dsRecTypeStandard:Users 4 dsAttrTypeStandard:RecordName externalbinary:dsAttrTypeStandard:JPEGPhoto dsAttrTypeStandard:UniqueID dsAttrTypeStandard:PrimaryGroupID dsAttrTypeStandard:GeneratedUID" > $HOME/avatar_import.txt
echo $USER:$HOME/Pictures/avatar.jpg:$UID:$(id -g):$(dscl . -read /Users/$USER GeneratedUID | cut -d' ' -f2) >> $HOME/avatar_import.txt
sudo dscl . -delete /Users/$USER JPEGPhoto
sudo dsimport $HOME/avatar_import.txt /Local/Default M -u diradmin
rm -f $HOME/avatar_import.txt

# Configure Dock
fancy_echo "Configuring dock..."
/usr/libexec/PlistBuddy -c "Add :magnification bool true" ~/Library/Preferences/com.apple.dock.plist
/usr/libexec/PlistBuddy -c "Add :autohide bool true" ~/Library/Preferences/com.apple.dock.plist
/usr/libexec/PlistBuddy -c "Delete :persistent-apps" ~/Library/Preferences/com.apple.dock.plist
/usr/libexec/PlistBuddy -c "Add :persistent-apps array" ~/Library/Preferences/com.apple.dock.plist

# Add new items to the dock
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Slack.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Mail.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Atom.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
killall Dock

# Restart Finder
fancy_echo "Restarting Finder..."
killall Finder && open /System/Library/CoreServices/Finder.app

fancy_echo "Rebuilding font cache..."
sudo atsutil databases -remove

# Build locate database
fancy_echo "Building locate database..."
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
sudo /usr/libexec/locate.updatedb
echo "Finished building locate database"

fancy_echo "Configuring terminal..."
# Set Terminal Colors
curl https://raw.githubusercontent.com/spartaglobal/laptop/master/assets/SpartaPro.terminal > "$HOME/SpartaPro.terminal"
open "$HOME/SpartaPro.terminal"
slep 10
osascript <<EOD
  tell application "Terminal"
    set default settings to settings set "SpartaPro"
    activate
  end tell
EOD
