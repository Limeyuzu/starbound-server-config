#!/bin/bash

# include mod list
. mods.sh

# download modlist using steamcmd
for mod in "${mods[@]}"
do
    workshopDownloadList+="+workshop_download_item 211820 $mod "
done
steamcmd +force_install_dir ./starbound +login $1 +app_update 211820 $workshopDownloadList validate +quit

# Remove existing mods
rm -r /home/steam/steamcmd/starbound/mods/

# Rename all contents.pak to {workshopId}.pak and move to mod folder
pushd /home/steam/steamcmd/starbound/steamapps/workshop/content/211820
for modDirectory in * ; do
    mv "${modDirectory}/contents.pak" "/home/steam/steamcmd/starbound/mods/${modDirectory}.pak"
done
popd
