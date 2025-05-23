#!/bin/bash

read -p "Enter the new hostname: " new_hostname

if [[ -z "$new_hostname" ]]; then
  echo "Hostname cannot be empty."
  exit 1
fi

echo "Setting hostname to '$new_hostname'..."
sudo hostnamectl set-hostname "$new_hostname"

if [[ $? -eq 0 ]]; then
  echo "Hostname successfully changed to '$new_hostname'."
else
  echo "Failed to change hostname."
  exit 1
fi
