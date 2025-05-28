#!/bin/bash

BACKUP_DIR=~/scripts/gnome-keybindings-backup
mkdir -p "$BACKUP_DIR"

echo "- Dumping ALL media keys (including default + custom)..."
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > "$BACKUP_DIR/media-keys.dconf"

echo "- Backing up window-manager keybindings..."
dconf dump /org/gnome/desktop/wm/keybindings/ > "$BACKUP_DIR/wm-keybindings.dconf"

echo "- Backing up desktop-interface keybindings..."
dconf dump /org/gnome/desktop/interface/ > "$BACKUP_DIR/interface.dconf"

echo "- Backing up xkb-options (keyboard layout tweaks)..."
gsettings get org.gnome.desktop.input-sources xkb-options > "$BACKUP_DIR/xkb-options.conf"

echo "Backup complete. Files saved to $BACKUP_DIR"
