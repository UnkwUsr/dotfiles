## tier1 (basic set)
AddPackage zsh # A very advanced and programmable command interpreter (shell) for UNIX
AddPackage zsh-completions # Additional completion definitions for Zsh
AddPackage --foreign zsh-syntax-highlighting-git # Fish shell like syntax highlighting for Zsh (from git)
AddPackage tmux # Terminal multiplexer
AddPackage ripgrep # A search tool that combines the usability of ag with the raw speed of grep
AddPackage fd # Simple, fast and user-friendly alternative to find
AddPackage fzf # Command-line fuzzy finder
AddPackage vifm # A file manager with curses interface, which provides Vi[m]-like environment
AddPackage bat # Cat clone with syntax highlighting and git integration
AddPackage git # the fast distributed version control system
AddPackage wget # Network utility to retrieve files from the Web
AddPackage jq # Command-line JSON processor
AddPackage aerc # Email Client for your Terminal
### text editor
AddPackage neovim # Fork of Vim aiming to improve user experience, plugins, and GUIs
AddPackage --foreign neovim-symlinks # Runs neovim if vi or vim is called
AddPackage words # A collection of International 'words' files for /usr/share/dict
# can't do now because /usr/share is in ignore
# CreateLink /usr/share/dict/words /usr/share/dict/british-english

## monitoring/diagnosing
AddPackage htop # Interactive process viewer
AddPackage nethogs # A net top tool which displays traffic used per process instead of per IP or interface
AddPackage lsof # Lists open files for running Unix processes
AddPackage ncdu # Disk usage analyzer with an ncurses interface
AddPackage --foreign ps_mem # List processes by memory usage
AddPackage progress # Shows running coreutils basic commands and displays stats
AddPackage hyperfine # A command-line benchmarking tool
AddPackage fastfetch # A feature-rich and performance oriented neofetch like system information tool

## home setup
AddPackage git-annex # Manage files with git, without checking their contents into git
AddPackage zk # A command-line tool helping you to maintain a Zettelkasten or personal wiki
AddPackage remind # A sophisticated calendar and alarm program.
AddPackage pass # Stores, retrieves, generates, and synchronizes passwords securely
AddPackage pass-otp # A pass extension for managing one-time-password (OTP) tokens.
AddPackage yt-dlp # A youtube-dl fork with additional features and fixes
# dependency for yt-dlp extract audio
AddPackage python-mutagen # An audio metadata tag reader and writer (python library)

## tier2
AddPackage tokei # A blazingly fast CLOC (Count Lines Of Code) program
AddPackage imagemagick # An image viewing/manipulation program
# dependency to support pdf
AddPackage ghostscript # An interpreter for the PostScript language
AddPackage rclone # Sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and Google Cloud Storage
    # for rclone mount
    AddPackage fuse3 # Interface for userspace programs to export a filesystem to the Linux kernel
# AddPackage torsocks # Wrapper to safely torify applications
# AddPackage gnuplot # Plotting package which outputs to X11, PostScript, PNG, GIF, and others
# AddPackage --foreign pandoc-bin # Pandoc - executable only, without 750MB Haskell depends/makedepends
AddPackage rsync # A fast and versatile file copying tool for remote and local files
AddPackage torsocks # Wrapper to safely torify applications

## utils
AddPackage patch # A utility to apply patch files to original sources
AddPackage which # A utility to show the full path of commands
# AddPackage dos2unix # Text file format converter
AddPackage libfaketime # Report fake dates and times to programs without having to change the system-wide time.
AddPackage moreutils # A growing collection of the unix tools that nobody thought to write thirty years ago
AddPackage kitty # terminal emulator. I use `kitten icat` from it
# AddPackage rlwrap # Adds readline-style editing and history to programs
AddPackage fortune-mod # The Fortune Cookie Program from BSD games
AddPackage android-tools # Android platform tools
AddPackage speedtest-cli # Command line interface for testing internet bandwidth using speedtest.net
AddPackage mtr # Combines the functionality of traceroute and ping into one tool (CLI version)
### archives
AddPackage unrar # The RAR uncompression program
AddPackage unzip # For extracting and viewing files in .zip archives
AddPackage 7zip # File archiver for extremely high compression
# this have util `rediff` that fixes patches in aconfmgr
AddPackage patchutils # A small collection of programs that operate on patch files
