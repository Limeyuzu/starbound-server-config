#!/bin/bash

# https://developer.valvesoftware.com/wiki/SteamCMD

# Do not run steamcmd while operating as the root user. Doing so is a security risk.
# Create a user called steam before installing and running:
# sudo useradd -m steam
# sudo passwd steam 

sudo add-apt-repository multiverse
sudo apt install software-properties-common
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install lib32gcc-s1 steamcmd 