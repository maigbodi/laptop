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

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Profile Picture
fancy_echo "Setting user avatar..."
echo "0x0A 0x5C 0x3A 0x2C dsRecTypeStandard:Users 4 dsAttrTypeStandard:RecordName externalbinary:dsAttrTypeStandard:JPEGPhoto dsAttrTypeStandard:UniqueID dsAttrTypeStandard:PrimaryGroupID dsAttrTypeStandard:GeneratedUID" > $HOME/avatar_import.txt
echo $USER:$HOME/Pictures/avatar.jpg:$UID:$(id -g):$(dscl . -read /Users/$USER GeneratedUID | cut -d' ' -f2) >> $HOME/avatar_import.txt
sudo dscl . -delete /Users/$USER JPEGPhoto
sudo dsimport $HOME/avatar_import.txt /Local/Default M -u diradmin
rm -f $HOME/avatar_import.txt

# Add new items to the dock
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Slack.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Atom.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
killall Dock

# Restart Finder
fancy_echo "Restarting Finder..."
killall Finder && open /System/Library/CoreServices/Finder.app

fancy_echo "Rebuilding font cache..."
sudo atsutil databases -remove

