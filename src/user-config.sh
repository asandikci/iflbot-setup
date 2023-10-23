#!/bin/bash
# general configs

### XFCE SETTINGS

# Dark Theme
xfconf-query -c "xsettings" -p "/Net/ThemeName" -s "pardus-xfce-dark" --type "string" --create
xfconf-query -c "xfwm4" -p "/general/theme" -s "pardus-xfce-dark" --type "string" --create
xfconf-query -c "xsettings" -p "/Net/IconThemeName" -s "pardus-xfce-dark" --type "string" --create

# Panel Size
xfconf-query --channel 'xfce4-panel' --property '/panels/panel-1/size' --type int --set 28 --create

### SUBLIME BUILDS
user=$([ -n "$SUDO_USER" ] && echo "$SUDO_USER" || echo "$USER")
SUBLIME_CONFIG_FILE="/home/${user}/.config/sublime-text/Packages/User/"
sudo cp "$1/sublime/gcc.sublime-build" "$SUBLIME_CONFIG_FILE"

### Desktop Files
mv "$1/example/" "/home/${user}/Masaüstü/'C Kodları'/"  