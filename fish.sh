#!/bin/bash

set -u 
START=$(date +%s%3N)
NET_HOME="/cs/home/$USER/"
HOME="/home/$USER/"

function bold () {
  echo -e "\e[92m$1\e[0m"
}

# BIN PATH INNIT
export BIN_DIR="$NET_HOME/usr/bin"

bold "Downloading Dependencies..."

bold "-> Downloading Starship..."
curl -sSOJ https://starship.rs/install.sh 
chmod +x ./install.sh
./install.sh --yes > /dev/null
rm ./install.sh

bold "-> Checking if fastfetch exists"
if [ ! -f "$BIN_DIR/fastfetch" ]; then
  bold "-> Installing fastfetch"
  bold "---> Cloning repository..."
  git clone --depth 1 https://github.com/fastfetch-cli/fastfetch.git fastfetch &> /dev/null

  bold "---> Starting Build"
  pushd fastfetch
  mkdir -p build/
  pushd build/
  cmake .. &> /dev/null
  cmake --build . --target fastfetch "-j$(nproc)" &> /dev/null


  bold "---> Copying binaries"
  cp "$(pwd)/fastfetch" "$BIN_DIR/fastfetch"

  bold "---> Cleaning up"
  popd 
  popd 
  rm -rf fastfetch
fi

bold "Making config directories..."

bold "-> Making the fish directory"
mkdir -p ~/.config/fish

bold "-> Creating symlinks..." 

bold "---> Symlinking config.fish..."
ln -sf $NET_HOME/dotfiles/fish/config.fish $HOME/.config/fish/config.fish
bold "---> Symlinking starship.toml..."
ln -sf $NET_HOME/dotfiles/configs/starship.toml $HOME/.config/starship.toml



TIME=$(("$(date +%s%3N)" - START))
bold Done in ${TIME}ms!
sleep 0.5
fish
