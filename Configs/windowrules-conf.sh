#!/bin/bash

HYPR_DIR=~/.config/hypr

if grep -q "#Custom Rules" $HYPR_DIR/windowrules.conf; then

    echo "Custom rules already exists"

else
    echo '

#Custom Rules
windowrulev2 = opacity 0.8 0.8,class:^(DBeaver)$
windowrulev2 = opacity 0.9.5 0.9.5,class:^(Brave-browser)$
windowrulev2 = opacity 0.8 0.8,class:^(chromium)$
windowrulev2 = opacity 0.8 0.8,class:^(Google-chrome)$
windowrulev2 = opacity 0.87 0.87,title:^(WhatsApp)$
windowrulev2 = opacity 0.87 0.87,class:^(Obsidian)$
windowrulev2 = opacity 0.87 0.87,class:^(GitHub Desktop)$
windowrulev2 = fullscreen,class:^(qemu-system-x86_64)$
windowrulev2 = workspace 2,class:^(qemu-system-x86_64)$
windowrulev2 = float,class:^(java)$
windowrulev2 = float,class:^(quickgui)$
windowrulev2 = maximize,class:^(vemto)$
windowrulev2 = opacity 0.8 0.8,class:^(vemto)$
windowrulev2 = opacity 0.90 0.90,class:^(firefox)$
windowrulev2 = opacity 0.80 0.80,class:^(Steam)$
windowrulev2 = opacity 0.80 0.80,class:^(steam)$
windowrulev2 = opacity 0.80 0.80,class:^(steamwebhelper)$
windowrulev2 = opacity 0.80 0.80,class:^(Spotify)$
windowrulev2 = opacity 0.80 0.80,class:^(Code)$
windowrulev2 = opacity 0.80 0.80,class:^(code-url-handler)$
windowrulev2 = opacity 0.80 0.80,class:^(kitty)$
windowrulev2 = opacity 0.80 0.80,class:^(org.kde.dolphin)$
windowrulev2 = opacity 0.80 0.80,class:^(org.kde.ark)$
windowrulev2 = opacity 0.80 0.80,class:^(nwg-look)$
windowrulev2 = opacity 0.80 0.80,class:^(qt5ct)$' | tee -a $HYPR_DIR/windowrules.conf
fi