#!/bin/bash

echo "- Restore media keys"
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < ~/scripts/gnome-keybindings-backup/media-keys.dconf

echo "- Restoring window-manager keybindings..."
dconf load /org/gnome/desktop/wm/keybindings/ < ~/scripts/gnome-keybindings-backup/wm-keybindings.dconf

echo "- Restoring interface keybindings..."
dconf load /org/gnome/desktop/interface/ < ~/scripts/gnome-keybindings-backup/interface.dconf

echo "- Restore xkb-options (keyboard layout tweaks)..."
gsettings set org.gnome.desktop.input-sources xkb-options "$(cat ~/scripts/gnome-keybindings-backup/xkb-options.conf)"

echo "Restore complete."
