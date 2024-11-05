#!/bin/bash
START=$(date +%s%3N)
NET_HOME="/cs/home/$USER/"
HOME="/home/$USER/"

echo "Downloading Dependencies..."

echo "-> Downloading Starship..."
# Starship requires this
export BIN_DIR="$NET_HOME/usr/bin"
curl -sSOJ https://starship.rs/install.sh 
chmod +x ./install.sh
./install.sh --yes > /dev/null
rm ./install.sh


echo "Making config directories..."

echo "-> Making the fish directory"
mkdir -p ~/.config/fish


echo
echo "Creating symlinks..." 


echo "-> Symlinking config.fish..."
ln -sf $NET_HOME/dotfiles/fish/config.fish $HOME/.config/fish/config.fish
echo "-> Symlinking starship.toml..."
ln -sf $NET_HOME/dotfiles/configs/starship.toml $HOME/.config/starship.toml



TIME=$(("$(date +%s%3N)" - START))
echo Done in ${TIME}ms!
sleep 0.5
fish
