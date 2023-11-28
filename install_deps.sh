#!/bin/bash

# vifm plugins
wget -nv -P ~/.config/vifm/ -x -nH --cut-dirs=4 \
    'https://raw.githubusercontent.com/vifm/vifm/f716368b053dcdb6019251a53d87183c0045ffc2/data/plugins/viewcolumn/init.lua'

# mpv plugins
wget -nv -P ~/.config/mpv/ -x -nH --cut-dirs=3 \
    'https://raw.githubusercontent.com/occivink/mpv-scripts/af360f332897dda907644480f785336bc93facf1/scripts/crop.lua' \
    'https://raw.githubusercontent.com/occivink/mpv-scripts/af360f332897dda907644480f785336bc93facf1/scripts/encode.lua' \
    'https://raw.githubusercontent.com/zenwarr/mpv-config/2a85d058403e67053eb3a70d1159718d884ec7a1/scripts/russian-layout-bindings.lua'
wget -nv -P ~/.config/mpv/scripts/ -x -nH --cut-dirs=3 \
    'https://raw.githubusercontent.com/viniciusbm/mpv-cycle-through-existing/738a79a450b53edcd254d6e6ab20323fbce1cf8f/cycle-through-existing.lua'

# lldb plugins
wget -nv -O ~/.config/lldb_write.py \
    'https://raw.githubusercontent.com/4iar/lldb-write/1baf24f9a524bbb967708307059d54b39943a9c3/write.py'
