#!/bin/bash
START=$(date +%s%3N)
HOME="/cs/home/$USER"


clear
echo Fetching latest version...
git pull
clear

echo Adding symlinks to user bin...
ln -sf $HOME/dotfiles/fishy /cs/home/$USER/usr/bin

TIME=$(("$(date +%s%3N)" - START))
echo Done in ${TIME}ms!
echo Try using the fishy command to start fish
