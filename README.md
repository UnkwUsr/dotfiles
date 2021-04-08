My dotfiles managed with rcm

# Installation (WIP)
* Symlink all config files with rcm: `rcup -v`
* Make binary config for less pager: `lesskey`
## Neovim
* Install vim-plug plugin manager for neovim: [neovim-plug](https://aur.archlinux.org/packages/neovim-plug/) (aur package)
* Install plugins: type `:PlugInstall` in vim
* Install [neovim-symlinks](https://aur.archlinux.org/packages/neovim-plug/) (aur package) to use command `vim` instead of `nvim`
## Zsh
* Install plugin manager [antibody](https://aur.archlinux.org/packages/antibody) (aur package)
* Install plugins: `antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh`
## Suckless programs
* See README.md in `suckless` folder
### Other programs
Can be installed via pacman

* `i3-gaps i3lock i3status-rust` - i3 window manager and related programs
* `dmenu` - program launcher
* `qutebrowser` - browser
* `gvim` - same vim but with x clipboard support
* `otf-font-awesome` - awesome font (used in i3status-rust)
* `ttf-hack` - hack font (used in i3)
* `diff-so-fancy` - diff pager for git
* `rofi-calc` - modal calculator
* `xclip` - easy interact with X clipboards
* `nethogs` - monitor net bandwith per process
* `mdp` - command-line markdown presentation tool

Can be installed from aur

* `redshift-minimal` - adjust screen temperature depending on time of day

