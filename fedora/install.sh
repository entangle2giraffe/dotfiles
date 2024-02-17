#!/bin/bash

# Check for root privileges
if ! [ "$(id -u)" = 0 ]; then
	echo "Please run as root."
	exit 1
fi

# Install dnf-plugins-core
echo "Installing dnf-plugins-core..."
dnf install dnf-plugins-core

# Install Development Tools
echo "Installing Development Tools..."
dnf groupinstall "Development Tools"

# Add Docker repository
echo "Adding Docker repository..."
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Install Docker
echo "Installing Docker..."
dnf install docker-ce docker-ce-cli containerd.io

# Start docker
echo "Starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

curl -sS https://starship.rs/install.sh | sh
