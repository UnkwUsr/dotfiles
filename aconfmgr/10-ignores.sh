IgnorePath '/boot/*'
IgnorePath '/opt/*'
IgnorePath '/var/*'
IgnorePath '/usr/lib/*'
IgnorePath '/usr/lib32/*'
IgnorePath '/usr/share/*'

# etc basic files
IgnorePath '/etc/adjtime'
IgnorePath '/etc/shells'
IgnorePath '/etc/subgid'
IgnorePath '/etc/subgid-'
IgnorePath '/etc/subuid'
IgnorePath '/etc/subuid-'
IgnorePath '/etc/group'
IgnorePath '/etc/group-'
IgnorePath '/etc/gshadow'
IgnorePath '/etc/gshadow-'
IgnorePath '/etc/ld.so.cache'
IgnorePath '/etc/ld.so.preload'
IgnorePath '/etc/hostname'
IgnorePath '/etc/machine-id'
IgnorePath '/etc/passwd-'
IgnorePath '/etc/passwd'
IgnorePath '/etc/shadow'
IgnorePath '/etc/shadow-'
IgnorePath '/etc/printcap'
IgnorePath '/etc/.pwd.lock'
IgnorePath '/etc/.updated'
IgnorePath '/etc/os-release'

IgnorePath '/etc/ca-certificates/extracted/*'
IgnorePath '/etc/ssl/certs/*'
IgnorePath '/etc/fonts/conf.d/*'
IgnorePath '/etc/pacman.d/gnupg/*'
IgnorePath '/etc/pacman.d/mirrorlist'
IgnorePath '/etc/texmf/*'
IgnorePath '/etc/cups/ppd/*'
IgnorePath '/etc/docker/key.json'
IgnorePath '/etc/wireguard/*'
IgnorePath '/etc/vmware/*'
IgnorePath '/etc/ssh/ssh_host_*'
IgnorePath '/etc/xml/*'
IgnorePath '/etc/conf.d/lm_sensors'
IgnorePath '/etc/anydesk/connection_trace.txt'
IgnorePath '/etc/anydesk/*'

IgnorePath '/etc/localtime'
IgnorePath '/etc/locale.gen'
IgnorePath '/etc/locale.conf'
IgnorePath '/etc/fstab'

IgnorePath '/etc/resolv.conf.head'

# might change
IgnorePath '/etc/mkinitcpio.d/linux-zen.preset'

# annoyings
IgnorePath '/etc/cni/*'
IgnorePath '/etc/vconsole.conf'
CreateDir '/etc/light/'
CreateDir /etc/openvpn/client 750 openvpn network
CreateDir /etc/openvpn/server 750 openvpn network
CreateDir /etc/colord '' colord colord
CreateDir /lost+found 700
# idk what they do, just annoys always
SetFileProperty /usr/bin/groupmems group groups
SetFileProperty /usr/bin/groupmems mode 2750
