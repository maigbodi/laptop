fancy_echo "Updating NVM, Node and NPM..."

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

nvm install node
node --version

npm update npm -g
npm update -g

fancy_echo "Istalling global NPM packages..."

npm install -g pryjs nodemon browser-sync

green_echo "Done with Node/NPM installs!"
