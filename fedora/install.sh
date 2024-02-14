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

# Install Neovim
echo "Installing Neovim"
dnf install -y neovim

# Clone your GitHub repository containing the LazyVim configuration
echo "Cloning LazyVim configuration..."
git clone https://github.com/entangle2giraffe/lazyvim-config $HOME/.config

# Move the cloned repository to the expected Neovim configuration directory
mv $HOME/.config/lazyvim-config $HOME/.config/nvim/

# Get Nerd Fonts
echo "Creating fonts directory..."
mkdir -p $HOME/.local/share/fonts
echo "Downloading Nerd Fonts..."
cd $HOME/.local/share/fonts && curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
tar -xvf JetBrainsMono.tar.xz

echo "Neovim, Docker, and LazyVim have been successfully installed."
