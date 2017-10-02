fancy_echo "Configuring rbenv..."
eval "$(rbenv init -)"

fancy_echo "Installing and setting ruby version..."
rbenv install 2.4.0
rbenv shell 2.4.0

fancy_echo "Rbenv rehash for good measure..."
rbenv rehash