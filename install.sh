#!/bin/bash
# installation script

cd || exit
mkdir tmp_install
cd tmp_install || exit
wget https://github.com/asandikci/iflbot-setup/archive/refs/heads/main.tar.gz
tar -xzvf main.tar.gz
cd iflbot-setup-main || exit
cd src || exit
chmod +x prerequisites.sh
chmod +x applications.sh
bash .prerequisites.sh
bash .applications.sh
