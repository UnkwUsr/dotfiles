Suckless programs

# St
1. Clone [st](https://aur.archlinux.org/packages/st) (aur package)
`auracle clone st`
2. Move to st folder
`cd st`
3. Apply config patch
`git apply ~/.dotfiles/suckless/st_aur.diff`
4. First build to generate config.def.h
`makepkg -s`
5. Copy config.def.h to config.h and modify font name and size
`cp config.def.h config.h`
6. Build again and install
`makepkg -fi`

