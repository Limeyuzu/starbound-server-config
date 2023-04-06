# Starbound linux dedicated server install with mods script

## How to use
1. Go to [releases](https://github.com/Limeyuzu/starbound-server-config/releases), find the latest tag and download `scripts.tgz` from your server from the home directory `~`. Extract the contents.
    * e.g. for v1.0.0:
        ```
        cd ~

        wget https://github.com/Limeyuzu/starbound-server-config/releases/download/v1.0.0/scripts.tgz

        tar -xvzf scripts.tgz && rm scripts.tgz
        ```
2. Run install-steam.sh if Steam is not installed (sudo required). There should be a Steam directory under home ~

3. Create the directory `/home/steam/steamcmd/starbound/mods/` and set this to be the folder to read all mod content from

4. Edit mods.sh and add the workshopIds that you want. Leave empty for no mods

5. Switch to the user used to install steamcmd (e.g. `su steam`)

6. Run `start-server.sh USER` where USER is your Steam username. You will be prompted for a password/MFA. This is required because Starbound does not allow anonymous downloads from Steam.
