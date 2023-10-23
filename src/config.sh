#!/bin/bash
# general configs

# NOT IPLEMENTED YET, see ./../README.md

### SUBLIME BUILDS


### XFCE SETTINGS
xfconf-query -c "xsettings" -p "/Net/ThemeName" -s "pardus-xfce-dark" --type "string" --create
xfconf-query -c "xfwm4" -p "/general/theme" -s "pardus-xfce-dark" --type "string" --create
xfconf-query -c "xsettings" -p "/Net/IconThemeName" -s "pardus-xfce-dark" --type "string" --create