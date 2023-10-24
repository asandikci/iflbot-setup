#!/bin/bash
# general configs

### XFCE SETTINGS

# Dark Theme
xfconf-query -c "xsettings" -p "/Net/ThemeName" -s "pardus-xfce-dark" --type "string" --create
xfconf-query -c "xfwm4" -p "/general/theme" -s "pardus-xfce-dark" --type "string" --create
xfconf-query -c "xsettings" -p "/Net/IconThemeName" -s "pardus-xfce-dark" --type "string" --create

# Panel Size
xfconf-query --channel 'xfce4-panel' --property '/panels/panel-1/size' --type int --set 28 --create

# Power Settings
xfconf-query --channel 'xfce4-power-manager' --property '/xfce4-power-manager/blank-on-ac' --type int --set 60 --create
xfconf-query --channel 'xfce4-power-manager' --property '/xfce4-power-manager/inactivity-on-ac' --type int --set 60 --create

### SUBLIME BUILDS
user=$([ -n "$SUDO_USER" ] && echo "$SUDO_USER" || echo "$USER")
SUBLIME_CONFIG_FILE="/home/${user}/.config/sublime-text/Packages/User/"
mkdir -p "$SUBLIME_CONFIG_FILE"
sudo cp "$1/sublime/iflbot-gcc.sublime-build" "$SUBLIME_CONFIG_FILE"

### Desktop Files
DESKTOP_CODE_FOLDER="/home/${user}/Masaüstü/C_Kodları/"
if [ ! -d "$DESKTOP_CODE_FOLDER" ]; then
  mv "$1/example/" "$DESKTOP_CODE_FOLDER"
fi

