#!/bin/bash

BACKUP_DIR=~/scripts/gnome-keybindings-backup

if [[ ! -f "$BACKUP_DIR/custom-keybindings.list" || ! -f "$BACKUP_DIR/custom-keybindings.dump" || ! -f "$BACKUP_DIR/launcher-hotkeys.dump" || ! -f "$BACKUP_DIR/xkb-options.conf"  ]]; then
    echo "Error: Missing backup files in $BACKUP_DIR"
    exit 1
fi

echo "- Restoring custom keybinding paths..."
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$(cat "$BACKUP_DIR/custom-keybindings.list")"

echo "- Restoring individual custom keybindings..."
bash "$BACKUP_DIR/custom-keybindings.dump"

echo "- Restoring launcher hotkeys..."
bash "$BACKUP_DIR/launcher-hotkeys.dump"

echo "- Restoring xkb-options (keyboard layout tweaks)..."
gsettings set org.gnome.desktop.input-sources xkb-options "$(cat "$BACKUP_DIR/xkb-options.conf")"

echo "GNOME keybindings and launcher hotkeys restored."

