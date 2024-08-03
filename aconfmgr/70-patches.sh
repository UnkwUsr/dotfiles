# just applying patches from patches/ directory

function ApplyPatch() { patch --no-backup-if-mismatch "$(GetPackageOriginalFile "$1" "$2")" "$3"; }
ApplyPatch systemd /etc/systemd/logind.conf ./patches/systemd_logind.conf.diff
ApplyPatch neovim /etc/xdg/nvim/sysinit.vim ./patches/neovim_sysinit.vim.diff
ApplyPatch pam /etc/security/faillock.conf ./patches/pam_faillock.conf.diff
ApplyPatch fuse-common /etc/fuse.conf ./patches/fuse-common_fuse.conf.diff
ApplyPatch filesystem /etc/hosts ./patches/filesystem_hosts.diff
ApplyPatch pacman /etc/makepkg.conf ./patches/pacman_makepkg.conf.diff
ApplyPatch pam /etc/environment ./patches/pam_environment.diff
ApplyPatch pacman /etc/pacman.conf ./patches/pacman_pacman.conf.diff
ApplyPatch sudo /etc/sudoers ./patches/sudo_sudoers.diff
ApplyPatch pambase /etc/pam.d/system-auth ./patches/pambase_system-auth.diff
ApplyPatch dnscrypt-proxy /etc/dnscrypt-proxy/dnscrypt-proxy.toml ./patches/dnscrypt-proxy_dnscrypt-proxy.toml.diff

ApplyPatch tor /etc/tor/torrc ./patches/tor_torrc.diff
function torrc_filter() { grep -v '^Bridge obfs4'; }
AddFileContentFilter '/etc/tor/torrc' torrc_filter
