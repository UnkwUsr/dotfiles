My dotfiles managed with [rcm](https://github.com/thoughtbot/rcm). System
config files and list of installed archlinux packages managed with
[aconfmgr](https://github.com/CyberShadow/aconfmgr) (see corresponding
directory).

## Excerpt

* terminal: [st (suckless)](https://st.suckless.org)
* shell: zsh
* terminal multiplexer: tmux
* text editor: neovim
* file manager: [vifm](https://github.com/vifm/vifm)
* graphical window manager (X11): [i3](https://i3wm.org)
* web browser: [qutebrowser](https://www.qutebrowser.org)
* media player: [mpv](https://mpv.io) for video and
  [feh](https://github.com/derf/feh) for images
* email: [aerc](https://git.sr.ht/~rjarry/aerc)

List of all installed packages (sorted by categories): [aconfmgr/](aconfmgr/)

## Worth noting

Here is mention of some things I'm proud of in my setup and think would be
interesting for passers-by.

* [git-fxa](bin/git-fxa) - script for making fixup commits by selecting target
  commit with fzf (don't know about fixup commits? [Read
  man](https://git-scm.com/docs/git-commit#Documentation/git-commit.txt---fixupamendrewordltcommitgt))
  * [gcfx](config/nvim/lua/user/gcfx.lua) - vim helper for fixing-up to commit
    who latest changed line under cursor
* [i3 binds](config/i3/binds/translate.i3) for language translation "on the go"
* [zsh aliases](config/zsh/aliases/pacman.zsh) for often used pacman commands.
  Just a lil collection of good things in pacman in one place
* [vim script](config/nvim/lua/user/dotfiles_prefill_commit.lua) for
  pre-filling commit message context part in dotfiles repo (it adds
  `[path/to/file] ` to start of each commit. It made me able do quick atomic
  commits while still maintaining clean history)
* [tmux binds](config/tmux/altish-binds.conf) without prefix key. This is the only
  way I was able to use tmux fast and without pain

### note-taking system

* [zsh aliases](config/zsh/aliases/txts.zsh) (this one best describes the whole
  system)
* [i3 binds](config/i3/binds/note_taking.i3) for taking inbox notes
* [gather_inbox](bin/gather-inbox.sh) - script for gathering notes from all
  other devices (via git) (also this doing voice-to-text recognizing for voice
  notes)
* [sync_to_relay](bin/termux/3sync_to_relay) and [schedule
  helpers](bin/termux/auto-sync/) - scripts used in termux on Android phone,
  which are pushing inbox to relay server
  * [buy-show-and-pull](bin/termux/1buy-show-and-pull) - one more script for
    phone which shows buy list and pulls updates
* [UnkwUsr/remind-done-tasks](https://github.com/UnkwUsr/remind-done-tasks) -
  helper scripts for dealing with repeating tasks in calendar managed with
  [remind(1)](https://dianne.skoll.ca/projects/remind/)

### More

* I do listen to internet radio. This is cool for always having source of fresh
  music and makes possible finding new ones (of course I still have archive of
  "favorite" tracks). Here is my list of internet radio stations:
  [UnkwUsr/radios_list](https://github.com/UnkwUsr/radios_list) . It takes time
  to collect something to your taste, but it's worth it

### And a little more of self-promotion

* [UnkwUsr/rclip](https://github.com/UnkwUsr/rclip) - clipboard manager with
  ability to save different clipboard entries (such as text or images), where
  each entry stored per file (also [on
  AUR](https://aur.archlinux.org/packages/rclip-git))
* [UnkwUsr/dalarma](https://github.com/UnkwUsr/dalarma) - alarm clock that will
  block your screen with alarm text, forcing you to get up from the computer
  (also [on AUR](https://aur.archlinux.org/packages/dalarma-git))
* [UnkwUsr/nctok](https://github.com/UnkwUsr/nctok) - TUI utility for
  interactive navigating through weighted hierarchical structured data and
  analyzing them (actually useful in unix-way style. Here is my usecases:
  [nctok.zsh](config/zsh/aliases/nctok.zsh))

# Installation (not for passers-by)

* Symlink all config files with rcm: `rcup -v`
* Run [./install_deps.sh](./install_deps.sh) to install plugins for some
  programs
* Apply aconfmgr: `aconfmgr -c ~/.dotfiles/aconfmgr/ --paranoid apply`

## neovim

* Install [vim-plug](https://github.com/junegunn/vim-plug) plugin manager
* Install plugins: type `:PlugInstall` in vim
* Install [neovim-symlinks](https://aur.archlinux.org/packages/neovim-symlinks)
  (aur package) to use command `vim` instead of `nvim`

## zsh

* Workaround to store zsh configs outside of home directory: `echo
  "ZDOTDIR=\$HOME/.config/zsh" >> ~/.zshenv`

## qutebrowser

* Set as default browser: `xdg-settings set default-web-browser
  me_quteb.desktop`
* Set program for pdf: `xdg-mime default org.pwmt.zathura.desktop
  application/pdf`
* Install dictionaries: `/usr/share/qutebrowser/scripts/dictcli.py install
  en-US ru-RU`

## rclone

* Symlink rclone config to real config in password-store: `mkdir -p
  ~/.config/rclone && ln -s ~/.password-store/rclone.conf ~/.config/rclone/`
  (should be absolute path symlink)
  * I can't put this symlink into dotfiles repo because then when rclone tries
    to write to this file, it sees symlink relative path and tries to write to
    it, but "relative" is meant from perspective inside dotfiles repo and in
    result it breaks (trying to write to `/home/.password-store/`)
    * probably can report this to rclone. Real problem is that they try to
      write to path from symlink and not just to the file it symlinks to. To
      reproduce you need to also make `~/.config/rclone/` symlink to
      `~/.dotfiles/config/rclone/`

## other

* for `light` tool: need to add current user to group video: `sudo usermod -a
  -G video $USER`
