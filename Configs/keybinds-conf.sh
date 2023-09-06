#!/bin/bash

HYPR_DIR=~/.config/hypr

#rofi binds
sed -i 's/\$mainMod, A, exec, pkill rofi/\$mainMod, space, exec, pkill rofi/' $HYPR_DIR/keybindings.conf


#Resize binds
sed -i 's/\$mainMod SHIFT, right, resizeactive/\$mainMod SHIFT CTRL, right, resizeactive/' $HYPR_DIR/keybindings.conf
sed -i 's/\$mainMod SHIFT, left, resizeactive/\$mainMod SHIFT CTRL, left, resizeactive/' $HYPR_DIR/keybindings.conf
sed -i 's/\$mainMod SHIFT, up, resizeactive/\$mainMod SHIFT CTRL, up, resizeactive/' $HYPR_DIR/keybindings.conf
sed -i 's/\$mainMod SHIFT, down, resizeactive/\$mainMod SHIFT CTRL, down, resizeactive/' $HYPR_DIR/keybindings.conf

# application shortcuts
sed -i 's/\$mainMod, T, exec, kitty/\$mainMod, return, exec, kitty/' $HYPR_DIR/keybindings.conf

if grep -q "# Move window" $HYPR_DIR/keybindings.conf; then
    echo "Custom bindings -> Move windows already exists"
else
echo '

# Move window
bind = $mainMod SHIFT, left, movewindow, l
bind = $mainMod SHIFT, right, movewindow, r
bind = $mainMod SHIFT, up, movewindow, u
bind = $mainMod SHIFT, down, movewindow, d' | tee -a $HYPR_DIR/keybindings.conf

fi

if grep -q "# Custom binds" $HYPR_DIR/keybindings.conf; then
    echo "Custom bindings -> KVM already exist"
else
cp Scripts/kvm-logi.sh $HYPR_DIR/scripts/
chmod +x "$HYPR_DIR/scripts/kvm-logi.sh"
echo '

# KVM Logitech
bind = $mainMod, F2, exec,~/.config/hypr/scripts/kvm-logi.sh' | tee -a $HYPR_DIR/keybindings.conf

fi

# Define the file path and the line to add
file_path_etc="/etc/modules-load.d/.conf"
file_path_usr="/usr/lib/modules-load.d/i2c_dev.conf"
line_to_add="i2c-dev"

# Check if the file exists, and create it if it doesn't
if [ ! -e "$file_path_etc" ]; then
    sudo touch "$file_path_etc"
    sudo touch "$file_path_usr"
fi

# Check if the line is already in the file, and add it if it's not
if ! grep -qF "$line_to_add" "$file_path_usr"; then
    sudo bash -c "echo '$line_to_add' >> '$file_path_etc'"
    sudo bash -c "echo '$line_to_add' >> '$file_path_usr'"
    echo "Added '$line_to_add' to $file_path_etc"
else
    echo "'$line_to_add' already exists in $file_path_etc"
fi