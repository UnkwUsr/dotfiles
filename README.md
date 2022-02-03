My dotfiles managed with [rcm](https://github.com/thoughtbot/rcm)

# Installation
* Symlink all config files with rcm: `rcup -v`
## neovim
* Install vim-plug plugin manager for neovim: [neovim-plug](https://aur.archlinux.org/packages/neovim-plug/) (aur package)
* Install plugins: type `:PlugInstall` in vim
* Install [neovim-symlinks](https://aur.archlinux.org/packages/neovim-plug/) (aur package) to use command `vim` instead of `nvim`
## zsh
* Install plugin manager [antibody](https://aur.archlinux.org/packages/antibody) (aur package)
* Install plugins: `antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh`
## qutebrowser
* Set as default browser: `xdg-settings set default-web-browser org.qutebrowser.qutebrowser.desktop`
* Install dictionaries: `/usr/share/qutebrowser/scripts/dictcli.py install en-US ru-RU`
## suckless programs
See [suckless/README.md](suckless/README.md)

## Other programs
Can be installed via pacman
* console
    * `ripgrep` - faster `grep` replacement
    * `fzf` - fuzzy-finder
    * `fd` - faster `find` replacement
    * `diff-so-fancy` - diff pager for git
    * `htop` - system status monitor
    * `tmux` - terminal multiplexor
    * `ncdu` - interactive ncurses disk usage viewer
    * `nethogs` - monitor net bandwidth per process
    * `progress` - show status of copying(or similar) process
    * `translate-shell` - cli program to do translations
* graphical
    * `i3-wm i3lock i3status-rust` - window manager and related programs
    * `dmenu` - dynamic menu used as program launcher and so on
    * `qutebrowser` - browser
    * `rofi-calc` - modal calculator
    * `feh` - images viewer and background setter
    * `mpv` - video viewer
    * `flameshot` - screenshot maker
    * `xclip` - easy interact with X clipboards
    * `dunst` - notification-daemon
    * `playerctl` - media players controller via MPRIS protocol
    * `peek` - lightweight screen recorder
    * `otf-font-awesome` - icons font (used in i3status-rust)
    * `ttf-hack` - hack font (used in i3)

Can be installed from aur
* `redshift-minimal` - adjust screen temperature depending on time of day
* `ponymix` - cli volume level control
* `mpv-sponsorblock-minimal-git` - sponsorblock script for mpv
* `rclip-git` - clipboard manager written in Rust. ([github](https://github.com/UnkwUsr/rclip))

Other
* `ticktask` - cli for creating tasks on ticktick.com ([github](https://github.com/UnkwUsr/ticktask))
* `dalarma` - alarm clock that will block your screen with alarm text ([github](https://github.com/UnkwUsr/dalarma))

# Scripts
See [bin/README.md](bin/README.md)
