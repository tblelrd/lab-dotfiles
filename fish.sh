#!/bin/bash

set -u 
START=$(date +%s%3N)
NET_HOME="/cs/home/$USER/"
HOME="/home/$USER/"

# BIN PATH INNIT
export BIN_DIR="$NET_HOME/usr/bin"

echo "Downloading Dependencies..."

echo "-> Downloading Starship..."
curl -sSOJ https://starship.rs/install.sh 
chmod +x ./install.sh
./install.sh --yes > /dev/null
rm ./install.sh

echo "-> Installing neofetch (fastfetch)"
echo "---> Cloning repository..."
git clone --depth 1 https://github.com/fastfetch-cli/fastfetch.git fastfetch

echo "---> Starting Build"
pushd fastfetch
mkdir -p build/
pushd build/
cmake ..
cmake --build . --target fastfetch "-j$(nproc)"

echo "---> Creating Symlinks"
ln -sf "$(pwd)/fastfetch" "$BIN_DIR/fastfetch"

echo "Making config directories..."

echo "-> Making the fish directory"
mkdir -p ~/.config/fish


echo
echo "-> Creating symlinks..." 


echo "---> Symlinking config.fish..."
ln -sf $NET_HOME/dotfiles/fish/config.fish $HOME/.config/fish/config.fish
echo "---> Symlinking starship.toml..."
ln -sf $NET_HOME/dotfiles/configs/starship.toml $HOME/.config/starship.toml



TIME=$(("$(date +%s%3N)" - START))
echo Done in ${TIME}ms!
sleep 0.5
fish
