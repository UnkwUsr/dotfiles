My dotfiles managed with rcm

# Installation
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
* `dmenu` - dynamic menu used as program launcher and so on
* `qutebrowser` - browser
* `otf-font-awesome` - awesome font (used in i3status-rust)
* `ttf-hack` - hack font (used in i3)
* `diff-so-fancy` - diff pager for git
* `rofi-calc` - modal calculator
* `xclip` - easy interact with X clipboards
* `nethogs` - monitor net bandwith per process
* `mdp` - command-line markdown presentation tool
* `ncdu` - interactive ncurses disk usage viewer
* `playerctl` - media players controller via MPRIS protocol
* `flameshot` - screenshot maker
* `ponymix` - cli volume level control
* `feh` - images viewer and background setter
* `fzf` - fuzzy-finder
* `dunst` - notification-daemon

Can be installed from aur

* `redshift-minimal` - adjust screen temperature depending on time of day
* `neovim-symlinks` - neovim symlinks for default vim commands

Not in repositories

* `rclip` - clipboard manager written in Rust. ([github](https://github.com/UnkwUsr/rclip))
