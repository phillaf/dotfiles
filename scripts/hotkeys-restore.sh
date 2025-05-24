#!/bin/bash

echo "- Restore ALL media keys (including default + custom)..."
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < ~/scripts/gnome-keybindings-backup/media-keys.dconf

echo "- Restore xkb-options (keyboard layout tweaks)..."
gsettings set org.gnome.desktop.input-sources xkb-options "$(cat ~/scripts/gnome-keybindings-backup/xkb-options.conf)"

echo "- Restoring window-manager keybindings..."
dconf load /org/gnome/desktop/wm/keybindings/ < ~/scripts/gnome-keybindings-backup/wm-keybindings.dconf

echo "Restore complete."
