#!/bin/bash

# Install Neovim
echo "Installing Neovim"
dnf install -y neovim

# Clone your GitHub repository containing the LazyVim configuration
echo "Cloning LazyVim configuration..."
git clone https://github.com/entangle2giraffe/lazyvim-config ~/.config/nvim

# Get Nerd Fonts
echo "Creating fonts directory..."
mkdir -p ~/.local/share/fonts
echo "Downloading Nerd Fonts..."
cd ~/.local/share/fonts && curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
tar -xvf JetBrainsMono.tar.xz
