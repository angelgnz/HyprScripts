#!/bin/bash

HYPR_DIR=~/.config/hypr

#input
sed -i 's/kb_layout = us/kb_layout = latam/' $HYPR_DIR/hyprland.conf
sed -i 's/natural_scroll = no/natural_scroll = yes/' $HYPR_DIR/hyprland.conf
sed -i 's/workspace_swipe_fingers = 3/workspace_swipe_fingers = 4/' $HYPR_DIR/hyprland.conf

#Launch
## Launch custom apps
if grep -q "overgrive" $HYPR_DIR/hyprland.conf; then
    echo "OverGrive already set"
else
    sed -i '/# Execute your favorite apps at launch/a exec = python /opt/thefanclub/overgrive/overgrive' $HYPR_DIR/hyprland.conf
fi

#ENV
##On PC use card0 on laptop card1 then card0
if grep -q "WLR_DRM_DEVICES" $HYPR_DIR/hyprland.conf; then
    echo "WLR_DRM_DEVICES Already configured."
else
    if lspci | grep -E 'VGA|3D' | grep -q "Mobile"; then
        echo "Mobile found in VGA/3D output"
        sed -i '/# Some default env vars./a env = WLR_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0' $HYPR_DIR/hyprland.conf
    else
        echo "Mobile not found in VGA/3D output"
        sed -i '/# Some default env vars./a env = WLR_DRM_DEVICES,/dev/dri/card0' $HYPR_DIR/hyprland.conf
    fi
fi