# just copying files from files/ directory

CreateLink /usr/local/sbin/log_smartctl /home/"$USER"/.bin/log_smartctl

CopyFile /etc/X11/xorg.conf.d/00-keyboard.conf
CopyFile /etc/X11/xorg.conf.d/20-amdgpu.conf
CopyFile /etc/X11/xorg.conf.d/30-touchpad.conf
CopyFile /etc/X11/xorg.conf.d/90-mouse.conf
CopyFile /etc/iwd/main.conf
CopyFile /etc/pacman.d/from_archive
CopyFile /etc/resolv.conf
CopyFile /etc/udev/rules.d/pm-light.rules
CopyFile /etc/sysctl.d/99-me.conf
CopyFile /etc/modprobe.d/me.conf
CopyFile /etc/systemd/system/iwd.timer
CopyFile /etc/systemd/system/lm_sensors.timer
CopyFile /etc/systemd/system/log-smartctl.service
CopyFile /etc/systemd/system/log-smartctl.timer
CopyFile /etc/systemd/system/powertop.service
CopyFile /etc/systemd/system/powertop.timer
CopyFile /etc/systemd/system/tor.timer
CopyFile /etc/systemd/system/set_sysrq_key.service
CopyFile /etc/keyd/default.conf
CopyFile /etc/libinput/local-overrides.quirks
