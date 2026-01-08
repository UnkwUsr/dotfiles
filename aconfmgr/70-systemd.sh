## enable some units
### defaults
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/user/default.target.wants/xdg-user-dirs-update.service /usr/lib/systemd/user/xdg-user-dirs-update.service
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire-pulse.socket /usr/lib/systemd/user/pipewire-pulse.socket
### my
CreateLink /etc/systemd/system/multi-user.target.wants/vnstat.service /usr/lib/systemd/system/vnstat.service
# CreateLink /etc/systemd/system/paths.target.wants/vmware-networks.path /usr/lib/systemd/system/vmware-networks.path
CreateLink /etc/systemd/system/sockets.target.wants/docker.socket /usr/lib/systemd/system/docker.socket
CreateLink /etc/systemd/system/multi-user.target.wants/dnscrypt-proxy.service /usr/lib/systemd/system/dnscrypt-proxy.service
CreateLink /etc/systemd/system/multi-user.target.wants/keyd.service /usr/lib/systemd/system/keyd.service
### my custom units
CreateLink /etc/systemd/system/timers.target.wants/iwd.timer /etc/systemd/system/iwd.timer
CreateLink /etc/systemd/system/timers.target.wants/lm_sensors.timer /etc/systemd/system/lm_sensors.timer
CreateLink /etc/systemd/system/timers.target.wants/log-smartctl.timer /etc/systemd/system/log-smartctl.timer
CreateLink /etc/systemd/system/timers.target.wants/tor.timer /etc/systemd/system/tor.timer
CreateLink /etc/systemd/system/multi-user.target.wants/set_sysrq_key.service /etc/systemd/system/set_sysrq_key.service

## mask units
function SystemdMask() { CreateLink "/etc/systemd/system/$1" /dev/null; }
SystemdMask hibernate.target
SystemdMask hybrid-sleep.target
SystemdMask sleep.target
SystemdMask suspend.target
SystemdMask systemd-backlight@backlight:acpi_video0.service
SystemdMask systemd-backlight@backlight:amdgpu_bl0.service
SystemdMask systemd-rfkill.service
SystemdMask systemd-rfkill.socket
