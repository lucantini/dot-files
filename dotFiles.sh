#!/usr/bin/env bash
# Setup
sudo apt-get update

# Curl
sudo apt-get install curl

# Git
sudo apt-get install git
git config --global user.email "lucafmcantini@gmail.com"
git config --global user.name "Luca Cantini"
git config --global push.default simple

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo apt-get update
sudo apt-get install docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER

# Guake
sudo apt-get install guake

# Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

# NVM
sudo apt-get update
apt-get install build-essential libssl-dev
curl https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash

# xclip
sudo apt-get install xclip

# ssh
ssh-keygen
xclip -sel clip < ~/.ssh/id_rsa.pub

# Navigate
cd Downloads

# Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.8.0-amd64.deb
sudo dpkg -i slack-desktop-2.8.0-amd64.deb

# WebStorm
wget https://download-cf.jetbrains.com/webstorm/WebStorm-2017.2.4.tar.gz
tar -xcf WebStorm-2017.2.4.tar.gz
cd WebStorm-172.4155.35/bin/
./webstorm.sh

# Clean
sudo rm -rf WebStorm-2017.2.4.tar.gz
sudo rm -rf google-chrome-stable_current_amd64.deb
sudo rm -rf slack-desktop-2.8.0-amd64.deb