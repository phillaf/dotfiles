#!/bin/bash

set -e

sudo dnf install -y docker docker-compose

sudo systemctl enable --now docker

if ! groups "$USER" | grep -q docker; then
    echo "Adding $USER to the docker group..."
    sudo usermod -aG docker "$USER"
    echo "You need to log out and back in for the group changes to take effect."
fi

newgrp docker

echo "Docker installes. Version:"
docker --version

echo "Docker Compose version:"
docker-compose --version
