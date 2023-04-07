#!/bin/bash

if [ -z "$1" ]; then
    echo "usage: ./start-server.sh STEAM_USERNAME"
    exit
fi

# include mod list
. mods.sh

# download modlist using steamcmd
for mod in "${mods[@]}"
do
    workshopDownloadList+="+workshop_download_item 211820 $mod "
done

# Remove existing mods
rm -r ~/.local/share/Steam/steamcmd/starbound/mods/*
rm -r ~/.local/share/Steam/steamcmd/starbound/steamapps/workshop/content/211820/*

steamcmd +login $1 +app_update 211820 $workshopDownloadList validate +quit

# Rename all contents.pak to {workshopId}.pak and move to mod folder
cd ~/.local/share/Steam/steamcmd/starbound/steamapps/workshop/content/211820
if [ ! -z "$(ls -A)" ]; then
    for modDirectory in * ; do
        cp ${modDirectory}/contents.pak ~/.local/share/Steam/steamcmd/starbound/mods/${modDirectory}.pak
    done
fi

# Start server
cd ~/.local/share/Steam/steamcmd/starbound/linux
./startbound_server
