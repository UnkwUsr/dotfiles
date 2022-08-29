# About

This is Half-Life 1 game config files.

* `my.cfg` originally was written for openag mod, but also works with pure hl1.
* `kz.cfg` is for kreedz-mod servers (cs 1.6 works too).

# Installation

Create cfg symlinks in the game directory:

```shell
ln -si $(realpath *.cfg) -t /path/to/Half-Life/mod_folder/
```

Also due to git not support file permissions, you need to manually set bit of
unwritable for all cfg files (in this folder, not in mod folder with symlinks):

```shell
chmod -w *.cfg
```
