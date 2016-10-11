fancy_echo "Updating NVM, Node and NPM..."

nvm install 0.10
node --version

npm update npm -g
npm update -g

fancy_echo "Istalling global NPM packages..."

npm install -g pryjs nodemon browser-sync

green_echo "Done with Node/NPM installs!"
