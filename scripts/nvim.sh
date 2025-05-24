#!/bin/bash
sudo dnf update -y
sudo dnf install -y neovim fzf ripgrep

echo "Installation complete!"

echo -n "Neovim version: "
nvim --version | head -n 1

echo -n "fzf version: "
fzf --version

