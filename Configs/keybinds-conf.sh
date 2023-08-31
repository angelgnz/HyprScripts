#!/bin/bash

HYPR_DIR=~/.config/hypr

#rofi binds
sed -i 's/\$mainMod, A, exec, pkill rofi/\$mainMod, space, exec, pkill rofi/' $HYPR_DIR/keybindings.conf


#Resize binds
sed -i 's/\$mainMod SHIFT, right, resizeactive/\$mainMod SHIFT CTRL, right, resizeactive/' $HYPR_DIR/keybindings.conf
sed -i 's/\$mainMod SHIFT, left, resizeactive/\$mainMod SHIFT CTRL, left, resizeactive/' $HYPR_DIR/keybindings.conf
sed -i 's/\$mainMod SHIFT, up, resizeactive/\$mainMod SHIFT CTRL, up, resizeactive/' $HYPR_DIR/keybindings.conf
sed -i 's/\$mainMod SHIFT, down, resizeactive/\$mainMod SHIFT CTRL, down, resizeactive/' $HYPR_DIR/keybindings.conf


if grep -q "# Move window" $HYPR_DIR/keybindings.conf; then
echo '

# Move window
bind = $mainMod SHIFT, left, movewindow, l
bind = $mainMod SHIFT, right, movewindow, r
bind = $mainMod SHIFT, up, movewindow, u
bind = $mainMod SHIFT, down, movewindow, d' | tee -a $HYPR_DIR/keybindings.conf

else
    echo "Custom bindings already exists"
fi