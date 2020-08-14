# About
This is Half-Life 1 config files.
`my.cfg` originally written for openag mod, but also work with pure 'valve' game.
`kz.cfg` is for kreedz-mod servers (cs1.6 works too)

# Installation
Create cfg symlinks in the game directory:

`ln -sfi $(realpath *.cfg) -t /path/to/Half-Life/mod_folder/`

Example:

`ln -sfi $(realpath *.cfg) -t ~/.steam/steam/steamapps/common/Half-Life/ag/`


Also due to git not support file permissions, you need manually set bit of unwritable for all cfg files(in this folder, not in mod folder with symlinks):

`chmod -w *.cfg`
