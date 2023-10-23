#!/bin/bash
# root configs

### LIGHTDM
# Auto Login

user=$([ -n "$SUDO_USER" ] && echo "$SUDO_USER" || echo "$USER")
sed -i -e "/autologin-user=/ s/= .*/=${user}/" /usr/share/lightdm/lightdm.conf.d/99-pardus-lightdm-greeter-autologin.conf