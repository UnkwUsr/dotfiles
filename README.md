My dotfiles managed with rcm

# Installation
* Symlink all config files with rcm: `rcup -v`
## Neovim
* Install vim-plug plugin manager for neovim: [neovim-plug](https://aur.archlinux.org/packages/neovim-plug/) (aur package)
* Install plugins: type `:PlugInstall` in vim
* Install [neovim-symlinks](https://aur.archlinux.org/packages/neovim-plug/) (aur package) to use command `vim` instead of `nvim`
## Zsh
* Install plugin manager [antibody](https://aur.archlinux.org/packages/antibody) (aur package)
* Install plugins: `antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh`
## Qutebrowser
* Set as default browser: `xdg-settings set default-web-browser org.qutebrowser.qutebrowser.desktop`
* Install dictionaries: `/usr/share/qutebrowser/scripts/dictcli.py install en-US ru-RU`
## Suckless programs
* See README.md in `suckless` folder
### Other programs
Can be installed via pacman

* `i3-wm i3lock i3status-rust` - window manager and related programs
* `dmenu` - dynamic menu used as program launcher and so on
* `qutebrowser` - browser
* `otf-font-awesome` - icons font (used in i3status-rust)
* `ttf-hack` - hack font (used in i3)
* `diff-so-fancy` - diff pager for git
* `rofi-calc` - modal calculator
* `xclip` - easy interact with X clipboards
* `nethogs` - monitor net bandwith per process
* `htop` - system status monitor
* `mdp` - command-line markdown presentation tool // TODO: mdp is not good enough. Change it
* `ncdu` - interactive ncurses disk usage viewer
* `playerctl` - media players controller via MPRIS protocol
* `flameshot` - screenshot maker
* `peek` - lightweight screen recorder
* `mpv` - video viewer
* `feh` - images viewer and background setter
* `fzf` - fuzzy-finder
* `ripgrep` - faster `grep` replacement
* `fd` - faster `find` replacement
* `dunst` - notification-daemon
* `translate-shell` - cli program to do translations
* `tmux` - terminal multiplexor
* `progress` - show status of copying (or simillar) process

Can be installed from aur

* `redshift-minimal` - adjust screen temperature depending on time of day
* `neovim-symlinks` - neovim symlinks for default vim commands
* `ponymix` - cli volume level control
* `rclip` - clipboard manager written in Rust. (also [github](https://github.com/UnkwUsr/rclip))
