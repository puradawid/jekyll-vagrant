# Install all needed packages for Jekyll and http-server
apt-get install -y screen curl ruby gem ruby-dev build-essential

# Install the NodeJS and NPM
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt-get install -y nodejs

# Install Jekyll and Mimima (theme for Jekyll)
gem install jekyll minima

# Install http-server
npm install -g http-server

echo "Packages installed!"

# Do the first build
cd /vagrant && jekyll build --config _config.yml,_config_dev.yml

# Run http-server and jekyll continuous build
cd /vagrant && \
  screen -dmS jekyll jekyll build --config _config.yml,_config_dev.yml --force_polling --watch && \
  screen -dmS http-server http-server -p 80 _site
