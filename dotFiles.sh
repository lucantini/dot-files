#!/usr/bin/env bash
# Colors
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

# Setup
sudo apt-get update

# Curl
sudo apt-get install curl --yes
echo "${green}Successfully installed Curl!${reset}"

# Git
sudo apt-get install git --yes
git config --global user.email $1
git config --global user.name $2
git config --global push.default simple
echo "${green}Successfully installed and configured Git!${reset}"

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client --yes
echo "${green}Successfully installed Spotify!${reset}"

# Guake
sudo apt-get install guake --yes
echo "${green}Successfully installed Guake!${reset}"

# Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7 --yes
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
echo "${green}Successfully installed Chrome!${reset}"

# NVM
sudo apt-get update
apt-get install build-essential libssl-dev --yes
curl https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
echo "${green}Successfully installed NVM!${reset}"

# xclip
sudo apt-get install xclip --yes
echo "${green}Successfully installed xclip!${reset}"

# ssh
ssh-keygen
xclip -sel clip < ~/.ssh/id_rsa.pub
echo "${green}Successfully created an ssh key and added it to the clipboard!${reset}"

# UpNext
wget https://github.com/ptgamr/upnext/blob/master/upnext-1.2.14.zip?raw=true
tar xvfz upnext-1.2.14.zip?raw=true
echo "${green}Successfully installed UpNext!${reset}"

# WebStorm
wget https://download-cf.jetbrains.com/webstorm/WebStorm-2017.3.4.tar.gz
tar xvfz WebStorm-2017.3.4.tar.gz
echo "${green}Successfully installed WebStorm!${reset}"

# Clean
sudo rm -rf WebStorm-2017.3.4.tar.gz &
sudo rm -rf google-chrome-stable_current_amd64.deb &
sudo rm -rf upnext-1.2.14.tar.gz?raw=true &
wait
