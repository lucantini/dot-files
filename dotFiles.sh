#!/usr/bin/env bash
# Colors
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

# Setup
sudo apt-get update

# Curl
sudo apt-get install curl
echo "${green}Successfully installed Curl!${reset}"

# Git
sudo apt-get install git
git config --global user.email $1
git config --global user.name $2
git config --global push.default simple
echo "${green}Successfully installed and configured Git!${reset}"

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client
echo "${green}Successfully installed Spotify!${reset}"

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
echo "${green}Successfully installed and configured Docker!${reset}"

# Guake
sudo apt-get install guake
echo "${green}Successfully installed Guake!${reset}"

# Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
echo "${green}Successfully installed Chrome!${reset}"

# NVM
sudo apt-get update
apt-get install build-essential libssl-dev
curl https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
echo "${green}Successfully installed NVM!${reset}"

# xclip
sudo apt-get install xclip
echo "${green}Successfully installed xclip!${reset}"

# ssh
ssh-keygen
xclip -sel clip < ~/.ssh/id_rsa.pub
echo "${green}Successfully created an ssh key and added it to the clipboard!${reset}"

# Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.8.0-amd64.deb
sudo dpkg -i slack-desktop-2.8.0-amd64.deb
echo "${green}Successfully installed Slack!${reset}"

# WebStorm
wget https://download-cf.jetbrains.com/webstorm/WebStorm-2017.2.4.tar.gz
tar xvfz WebStorm-2017.2.4.tar.gz
cd WebStorm-172.4155.35/bin/
echo "${green}Successfully installed WebStorm!${reset}"
./webstorm.sh &

# Clean
sudo rm -rf WebStorm-2017.2.4.tar.gz &
sudo rm -rf WebStorm-172.4155.35/ &
sudo rm -rf google-chrome-stable_current_amd64.deb &
sudo rm -rf slack-desktop-2.8.0-amd64.deb &
wait