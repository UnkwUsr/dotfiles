# tier 1
AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage base-devel # Basic tools to build Arch Linux packages
AddPackage linux-zen # The Linux ZEN kernel and modules
AddPackage linux-zen-headers # Headers and scripts for building modules for the Linux ZEN kernel
AddPackage amd-ucode # Microcode update image for AMD CPUs
AddPackage bluez # Daemons for the bluetooth protocol stack
AddPackage bluez-utils # Development and debugging utilities for the bluetooth protocol stack
AddPackage iwd # Internet Wireless Daemon
AddPackage pipewire-alsa # Low-latency audio/video router and processor - ALSA configuration
AddPackage pipewire-pulse # Low-latency audio/video router and processor - PulseAudio replacement
AddPackage man-db # A utility for reading man pages
AddPackage man-pages # Linux man pages
AddPackage sudo # Give certain users the ability to run some commands as root

# system maintenance
AddPackage --foreign rcm # rc file (dotfiles) management
AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux
AddPackage --foreign auracle-git # A flexible client for the AUR
AddPackage --foreign paru # Feature packed AUR helper

# hardware dependant
AddPackage linux-firmware-amdgpu # Firmware files for Linux - Firmware for AMD Radeon GPUs
AddPackage linux-firmware-other # Firmware files for Linux - Unsorted firmware for various devices
AddPackage linux-firmware-qcom # Firmware files for Linux - Firmware for Qualcomm SoCs
AddPackage linux-firmware-radeon # Firmware files for Linux - Firmware for ATI Radeon GPUs
AddPackage linux-firmware-realtek # Firmware files for Linux - Firmware for Realtek devices
# this seems to must be here because of aconfmgr specifics. idk
AddPackage linux-firmware # Firmware files for Linux - Default set

# tier 2 (not vital)
AddPackage powertop # A tool to diagnose issues with power consumption and power management
AddPackage dnscrypt-proxy # A flexible DNS proxy, with support for encrypted DNS protocols
AddPackage smartmontools # Control and monitor S.M.A.R.T. enabled ATA and SCSI Hard Drives
AddPackage vnstat # A console-based network traffic monitor
AddPackage --foreign kbfs # The Keybase filesystem
AddPackage --foreign keybase # CLI tool for GPG with keybase.io
AddPackage acpi # Client for battery, power, and thermal readings

## idk
# AddPackage polkit-gnome # Legacy polkit authentication agent for GNOME
# AddPackage polkit-kde-agent # Daemon providing a polkit authentication UI for KDE
# AddPackage gstreamer-vaapi # Multimedia graph framework - vaapi plugin
