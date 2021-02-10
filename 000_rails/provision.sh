apt update

# install dev tools
apt install -y autoconf \
  bison \
  curl \
  g++ \
  git \
  libffi-dev \
  libgconf-2-4 \
  libgdbm-dev \
  libncurses5-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libxi6 \
  libyaml-dev \
  make \
  sqlite3 \
  xvfb \
  zip \
  zlib1g-dev

# install nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt install -y nodejs

# install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt update && sudo apt install -y yarn

#install ruby and rails
if [ ! -d ~/.rbenv ]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
fi

if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
fi

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

eval "$(rbenv init -)"

rbenv install 2.6.5
rbenv global 2.6.5
gem install rails --version=6.0.1 --no-document

# install chrome driver
curl -sS -0 - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
apt -y update
apt -y install google-chome-stable
wget https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
mv chromedriver /usr/bin/chromedriver
chown root:root /usr/bin/chromedriver
chmod +x /usr/bin/chromedriver
