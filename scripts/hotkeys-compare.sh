#!/bin/bash

BACKUP_DIR=~/scripts/gnome-keybindings-backup
TMP_DIR=$(mktemp -d)
CURRENT_FILE="$TMP_DIR/current-media-keys.dconf"
BACKUP_FILE="$BACKUP_DIR/media-keys.dconf"

echo "- Dumping current media-keys to temporary file..."
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > "$CURRENT_FILE"

echo "- Comparing with backup..."
if [ -f "$BACKUP_FILE" ]; then
    diff -u "$CURRENT_FILE" "$BACKUP_FILE" | less
else
    echo "No backup found at $BACKUP_FILE"
fi

# Clean up temp files
rm -r "$TMP_DIR"
