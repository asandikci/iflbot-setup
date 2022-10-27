#!/bin/bash
# setup script for applications

#Sublime Text https://www.sublimetext.com/docs/linux_repositories.html
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update -y
sudo apt-get install sublime-text -y

#File-roller
sudo apt install file-roller -y

#VLC
sudo apt-get install vlc -y

#Xournal++
sudo apt update -y
sudo apt install xournalpp -y

#VS Code https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-20-04/
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
sudo apt install code -y
sudo apt update -y

#Chrome https://askubuntu.com/questions/510056/how-to-install-google-chrome
wget https://dl-ssl.google.com/linux/linux_signing_key.pub -O /tmp/google.pub
gpg --no-default-keyring --keyring /etc/apt/keyrings/google-chrome.gpg --import /tmp/google.pub
echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update -y
sudo apt-get install google-chrome-stable -y

#gedit
sudo apt-get install gedit -y

#gnome-disk-utility
sudo apt-get install gnome-disk-utility -y
sudo apt upgrade -y
