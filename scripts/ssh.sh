#!/bin/bash

KEY_NAME="id_rsa"
PUB_KEY_NAME="id_rsa.pub"
SSH_DIR="$HOME/.ssh"
PRIVATE_KEY_PATH="$SSH_DIR/$KEY_NAME"
PUBLIC_KEY_PATH="$SSH_DIR/$PUB_KEY_NAME"

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

echo "Paste the private key (id_rsa), then press Ctrl+D:"
cat > "$PRIVATE_KEY_PATH"
chmod 600 "$PRIVATE_KEY_PATH"

echo "Paste the public key (id_rsa.pub), then press Ctrl+D:"
cat > "$PUBLIC_KEY_PATH"
chmod 644 "$PUBLIC_KEY_PATH"

# Add the key to the ssh-agent
 eval "$(ssh-agent -s)"
 ssh-add "$PRIVATE_KEY_PATH"

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME remote set-url origin git@github.com:phillaf/dotfiles.git
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push --set-upstream origin main
