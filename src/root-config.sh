#!/bin/bash
# root configs

### LIGHTDM
# Auto Login
AUTO_LOGIN_FILE=/usr/share/lightdm/lightdm.conf.d/99-pardus-lightdm-greeter-autologin.conf

sudo mv "$1/config/lightdm-autologin" $AUTO_LOGIN_FILE
user=$([ -n "$SUDO_USER" ] && echo "$SUDO_USER" || echo "$USER")
sudo sed -i -e "s/autologin-user=.*/autologin-user=${user}/" $AUTO_LOGIN_FILE