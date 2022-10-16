#!/bin/bash

# vifm plugins
wget -nv -P ~/.config/vifm/ -x -nH --cut-dirs=4 \
    'https://raw.githubusercontent.com/vifm/vifm/f716368b053dcdb6019251a53d87183c0045ffc2/data/plugins/viewcolumn/init.lua'

# lldb plugins
wget -nv -O ~/.config/lldb_write.py \
    'https://raw.githubusercontent.com/4iar/lldb-write/1baf24f9a524bbb967708307059d54b39943a9c3/write.py'
