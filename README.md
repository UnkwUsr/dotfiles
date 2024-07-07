My dotfiles managed with [rcm](https://github.com/thoughtbot/rcm)

# Installation

* Symlink all config files with rcm: `rcup -v`
* Run [./install_deps.sh](./install_deps.sh) to install plugins for some
  programs

## neovim

* Install [vim-plug](https://github.com/junegunn/vim-plug) plugin manager
* Install plugins: type `:PlugInstall` in vim
* Install [neovim-symlinks](https://aur.archlinux.org/packages/neovim-symlinks)
  (aur package) to use command `vim` instead of `nvim`

## zsh

* Install plugin manager
  [antibody](https://aur.archlinux.org/packages/antibody) (aur package)
* Install plugins: `antibody bundle < ~/.config/zsh/plugins.txt >
  ~/.local/share/zsh_plugins.sh`
* Workaround to store zsh configs outside of home directory: `echo
  "ZDOTDIR=\$HOME/.config/zsh" >> ~/.zshenv`

## qutebrowser

* Set as default browser: `xdg-settings set default-web-browser
  org.qutebrowser.qutebrowser.desktop`
* Set program for pdf: `xdg-mime default org.pwmt.zathura.desktop
  application/pdf`
* Install dictionaries: `/usr/share/qutebrowser/scripts/dictcli.py install
  en-US ru-RU`

## suckless programs

See [suckless/README.md](suckless/README.md)

## Other programs

Can be installed via pacman

* console
  * `ripgrep` - faster `grep` replacement
  * `fzf` - fuzzy-finder
  * `fd` - faster `find` replacement
  * `bat` - `cat` with syntax highlight
  * `diff-so-fancy` - diff pager for git
  * `htop` - system status monitor
  * `tmux` - terminal multiplexor
  * `ncdu` - interactive ncurses disk usage viewer
  * `nethogs` - monitor net bandwidth per process
  * `progress` - show status of copying(or similar) process
  * `wget` - cli downloader
  * `yt-dlp` - cli to download videos from different sources
  * `translate-shell` - cli program to do translations
  * `playerctl` - media players controller via MPRIS protocol
  * X11 utils
    * `xss-lock` - lock screen on idle
    * `xorg-xev` - show X events and keypresses
    * `xclip` - easy interact with X clipboards
* graphical
  * `i3-wm i3lock i3status-rust` - window manager and related programs
  * `dmenu` - dynamic menu used as program launcher and so on
  * `qutebrowser` - browser
  * `zathura` - pdf viewer
  * `rofi-calc` - modal calculator
  * `feh` - images viewer and background setter
  * `mpv` - video and audio player
  * `flameshot` - screenshot maker
  * `dunst` - notification-daemon
  * `peek` - lightweight screen recorder
  * `fcitx5 fcitx5-mozc fcitx5-gtk fcitx5-qt` - for Japanese input method
  * fonts
    * `ttf-hack` - text font (used in i3)
    * `otf-ipafont adobe-source-han-sans-jp-fonts
      adobe-source-han-serif-jp-fonts` - Japanese fonts
    * `ttf-font-awesome` - icons font (used in i3status-rust)

Can be installed from aur

* `redshift-minimal` - adjust screen temperature depending on time of day
* `ponymix` - cli volume level control
* `dragon-drop` - drag-and-drop source/sink cli
* `mpv-sponsorblock-minimal-git` - sponsorblock script for mpv
* `nodejs-markdownlint-cli` - markdown formatter
* `python-myougiden` - cli Japanese dictionary
* `rclip-git` - clipboard manager written in Rust
  ([github](https://github.com/UnkwUsr/rclip))

Other

* `ticktask` - cli for creating tasks on ticktick.com
  ([github](https://github.com/UnkwUsr/ticktask))
* `dalarma` - alarm clock that will block your screen with alarm text
  ([github](https://github.com/UnkwUsr/dalarma))

# Scripts

See [bin/README.md](bin/README.md)
