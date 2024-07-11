# from https://github.com/CyberShadow/aconfmgr/issues/46

import os
import subprocess


def file_belongs_to_package(path):
    try:
        output = subprocess.check_output("pacman -Qo " + path, shell=True).decode('ascii')
    except: # if 'is owned by' not in output:
        return None, None
    # example of expected output:
    # /etc/pacman.conf is owned by pacman 5.1.3-1
    pkg_name, pkg_ver = output.strip().split(' ')[-2:]
    return pkg_name, pkg_ver


def diff_against_pkg_default(path, pkg_name, pkg_ver):
    diff_file = pkg_name + '_' + os.path.split(path)[1] + '.diff'
    # https://bbs.archlinux.org/viewtopic.php?pid=1464430#p1464430
    # Example:
    # tar -xOf /var/cache/pacman/pkg/pacman-5.1.3-1-x86_64.pkg.tar.xz etc/pacman.conf | diff -u - /etc/pacman.conf
    command = f'tar -xOf /var/cache/pacman/pkg/{pkg_name}-{pkg_ver}-*.pkg.tar.zst {path[1:]} | diff -u --label="" --label="" - {path} > {diff_file}'
    subprocess.call(command, shell=True)
    return diff_file


with open('99-unsorted.sh', 'r') as f:
    lines = f.read(-1).splitlines()

aconf_cmds = []
for line in lines:
    if not line.startswith('CopyFile'):
        continue
    path = line.split(' ')[1]
    pkg_name, pkg_ver = file_belongs_to_package(path)
    if pkg_name is None:
        continue
    diff_file = diff_against_pkg_default(path, pkg_name, pkg_ver)
    aconf_cmd = f'patch "$(GetPackageOriginalFile {pkg_name} {path})" ./config/{diff_file}'
    aconf_cmds.append(aconf_cmd)

with open ('98-patches.sh', 'w') as f:
    f.write('\n'.join(aconf_cmds))
