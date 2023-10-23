#!/bin/bash
# root configs

### LIGHTDM
# Auto Login

echo "$1"
echo "$2"
echo "$3"
echo "$4"
echo "$5"
# user=$([ -n "$SUDO_USER" ] && echo "$SUDO_USER" || echo "$USER")
# sed -i -e "s/autologin-user=.*/autologin-user=${user}/" /usr/share/lightdm/lightdm.conf.d/99-pardus-lightdm-greeter-autologin.conf