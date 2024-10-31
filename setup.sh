#!/bin/bash
START=$(date +%s%3N)

clear
echo Fetching latest version...
git pull
clear

echo Copying command to user bin...
cp ./fishy /cs/home/$USER/usr/bin

TIME=$(("$(date +%s%3N)" - START))
echo Done in ${TIME}ms!
echo Try using the fishy command to start fish
