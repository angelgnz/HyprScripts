#!/bin/bash

HYPR_DIR=~/.config/hypr

if grep -q "#Custom WorkSpaces" $HYPR_DIR/monitors.conf; then

    echo "Custom rules already exists"

else    
    echo '

#Custom WorkSpaces
#monitor = DP-1, 2560x1440@144, 1920x0, 1
#monitor = HDMI-A-1, 1920x1080@144, 0x0, 1

workspace = HDMI-A-1, 1
workspace = HDMI-A-1, 2
workspace = HDMI-A-1, 3
workspace = DP-1, 4
workspace = DP-1, 5
workspace = DP-1, 6
workspace = DP-1, 7
workspace = DP-1, 8
workspace = DP-1, 9
workspace = DP-1, 10' | tee -a $HYPR_DIR/monitors.conf

fi
