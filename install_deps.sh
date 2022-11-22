#!/bin/bash

# vifm plugins
wget -nv -P ~/.config/vifm/ -x -nH --cut-dirs=4 \
    'https://raw.githubusercontent.com/vifm/vifm/f716368b053dcdb6019251a53d87183c0045ffc2/data/plugins/viewcolumn/init.lua'
