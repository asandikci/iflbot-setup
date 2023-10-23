#!/bin/bash
# general configs

### XFCE SETTINGS

# Dark Theme
xfconf-query -c "xsettings" -p "/Net/ThemeName" -s "pardus-xfce-dark" --type "string" --create
xfconf-query -c "xfwm4" -p "/general/theme" -s "pardus-xfce-dark" --type "string" --create
xfconf-query -c "xsettings" -p "/Net/IconThemeName" -s "pardus-xfce-dark" --type "string" --create

# Panel Size
xfconf-query --channel 'xfce4-panel' --property '/panels/panel-1/size' --type int --set 28



### SUBLIME BUILDS