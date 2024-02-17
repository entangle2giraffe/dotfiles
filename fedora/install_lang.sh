!/bin/bash

sudo dnf install golang

echo "Installing Golang..."
mkdir -p ~/go
echo 'export GOPATH=$HOME/go' >>~/.bashrc
source ~/.bashrc

echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
