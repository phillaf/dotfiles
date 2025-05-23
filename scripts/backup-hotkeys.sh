#!/bin/bash

BACKUP_DIR=~/scripts/gnome-keybindings-backup
mkdir -p "$BACKUP_DIR"

echo "- Backing up custom keybindings list..."
gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings > "$BACKUP_DIR/custom-keybindings.list"

echo "- Dumping individual custom keybindings..."
> "$BACKUP_DIR/custom-keybindings.dump"
for path in $(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings | sed "s/\[//;s/\]//;s/,//g; s/'//g"); do
    full_path="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$path"
    echo "# $full_path" >> "$BACKUP_DIR/custom-keybindings.dump"
    echo "gsettings set $full_path name \"$(gsettings get $full_path name | sed 's/^.\(.*\).$/\1/')\"" >> "$BACKUP_DIR/custom-keybindings.dump"
    echo "gsettings set $full_path command \"$(gsettings get $full_path command | sed 's/^.\(.*\).$/\1/')\"" >> "$BACKUP_DIR/custom-keybindings.dump"
    echo "gsettings set $full_path binding \"$(gsettings get $full_path binding | sed 's/^.\(.*\).$/\1/')\"" >> "$BACKUP_DIR/custom-keybindings.dump"
    echo "" >> "$BACKUP_DIR/custom-keybindings.dump"
done

echo "- Backing up standard launcher hotkeys..."
HOTKEY_SCHEMA="org.gnome.settings-daemon.plugins.media-keys"
HOTKEY_KEYS=$(gsettings list-keys $HOTKEY_SCHEMA | grep -v custom-keybindings)

> "$BACKUP_DIR/launcher-hotkeys.dump"
for key in $HOTKEY_KEYS; do
    value=$(gsettings get $HOTKEY_SCHEMA $key)
    echo "gsettings set $HOTKEY_SCHEMA $key \"$value\"" >> "$BACKUP_DIR/launcher-hotkeys.dump"
done

echo "- Backing up xkb-options (keyboard layout tweaks)..."
gsettings get org.gnome.desktop.input-sources xkb-options > "$BACKUP_DIR/xkb-options.conf"

echo "Backup complete. Files saved to $BACKUP_DIR"
