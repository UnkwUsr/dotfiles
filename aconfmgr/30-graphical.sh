# packages providing graphical stuff or those used only in such environment

## base (graphical server, wm, etc.)
AddPackage xorg-server # Xorg X server
AddPackage xorg-xinit # X.Org initialisation program
AddPackage xf86-video-amdgpu # X.org amdgpu video driver
AddPackage xss-lock # Use external locker as X screen saver
AddPackage i3-wm # Improved dynamic tiling window manager
AddPackage i3lock # Improved screenlocker based upon XCB and PAM
AddPackage i3status-rust # Resourcefriendly and feature-rich replacement for i3status, written in pure Rust
AddPackage upower # laptop battery stats (for i3status-rust)
AddPackage dmenu # Generic menu for X
AddPackage dunst # Customizable and lightweight notification-daemon

## fonts
AddPackage ttf-hack # A hand groomed and optically balanced typeface based on Bitstream Vera Mono.
AddPackage ttf-dejavu # Font family based on the Bitstream Vera Fonts with a wider range of characters
AddPackage ttf-droid # General-purpose fonts released by Google as part of Android
AddPackage noto-fonts-emoji # Google Noto emoji fonts
AddPackage ttf-font-awesome # Iconic font designed for Bootstrap
AddPackage --foreign font-lobster # Lobster font which is popular in vkontakte and russian memes
AddPackage arc-gtk-theme # A flat theme with transparent elements for GTK 2,3,4 and Gnome-Shell

## main tools
AddPackage --foreign st # A simple virtual terminal emulator for X.
AddPackage qutebrowser # A keyboard-driven, vim-like browser based on Python and Qt
AddPackage python-adblock # Brave's adblock library in Python
AddPackage flameshot # Powerful yet simple to use screenshot software
AddPackage rofi-calc # Do calculations in rofi
AddPackage --foreign dalarma-git # cli timer that forces you to get up from the computer
AddPackage wmctrl # Control your EWMH compliant window manager from command line
AddPackage --foreign rclip-git # Clipboard manager written in rust with ability to save different entry types (text, images, etc.)
AddPackage pavucontrol # PulseAudio Volume Control
AddPackage qbittorrent # An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar
AddPackage tigervnc # Suite of VNC servers and clients. Based on the VNC 4 branch of TightVNC.
AddPackage --foreign redshift-minimal # Adjusts the color temperature of your screen according to your surroundings, with minimal dependencies.
AddPackage --foreign xbanish-git # Banish the mouse cursor when typing, show it again when the mouse moves.

## japanese (IME and fonts)
AddPackage fcitx5-mozc # Fcitx5 Module of A Japanese Input Method (the Open Source Edition of Google Japanese Input)
AddPackage fcitx5-gtk # Fcitx5 gtk im module and glib based dbus client library
AddPackage fcitx5-qt # Fcitx5 Qt Library (Qt5 & Qt6 integrations)
AddPackage fcitx5-configtool # Configuration Tool for Fcitx5
AddPackage fcitx5-material-color # Material color theme for fcitx5
AddPackage adobe-source-han-sans-jp-fonts # Adobe Source Han Sans Subset OTF - Japanese OpenType/CFF fonts
AddPackage adobe-source-han-serif-jp-fonts # Adobe Source Han Serif Subset OTF - Japanese OpenType/CFF fonts
AddPackage otf-ipafont # Japanese outline fonts by Information-technology Promotion Agency, Japan (IPA)

## utils
AddPackage screenkey # A screencast tool to display your keys inspired by Screenflick
AddPackage xdotool # Command-line X11 automation tool
AddPackage xorg-xev # Print contents of X events
AddPackage xorg-xkill # Kill a client by its X resource
AddPackage --foreign light # A program to control backlights (and other hardware lights)
AddPackage --foreign dragon-drop # Simple drag-and-drop source/sink for X or Wayland
AddPackage --foreign xclip-git # Command line interface to the X11 clipboard
AddPackage mesa-utils # Essential Mesa utilities
AddPackage xorg-xinput # Small commandline tool to configure devices
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.

## apps
AddPackage telegram-desktop # Official Telegram Desktop client
AddPackage steam # Valve's digital software delivery system
AddPackage songrec # An open-source, unofficial Shazam client for Linux
AddPackage nicotine+ # Soulseek music-sharing client, written in python
AddPackage libreoffice-still # LibreOffice maintenance branch
AddPackage libreoffice-still-ru # Russian language pack for LibreOffice still
AddPackage hyphen-en # English hyphenation rules
AddPackage --foreign brave-bin # Web browser that blocks ads and trackers by default (binary release)
AddPackage --foreign anki-bin # Helps you remember facts (like words/phrases in a foreign language) efficiently. Installed with wheel.
AddPackage --foreign anydesk-bin # The Fast Remote Desktop Application
AddPackage --foreign sunshine-bin # A self-hosted game stream host for Moonlight.
AddPackage --foreign waydroid # A container-based approach to boot a full Android system on a regular Linux system
AddPackage --foreign immersed # Immersed Desktop Agent
AddPackage discord # All-in-one voice and text chat for gamers
AddPackage chromium # A web browser built for speed, simplicity, and security
# AddPackage pdfarranger # Helps merge or split PDF documents and rotate, crop and rearrange pages

## other stuff
AddPackage vulkan-radeon # Open-source Vulkan driver for AMD GPUs
AddPackage vkd3d # Direct3D 12 to Vulkan translation library By WineHQ
AddPackage mesa-vdpau # Open-source VDPAU drivers
AddPackage libva-mesa-driver # Open-source VA-API drivers
