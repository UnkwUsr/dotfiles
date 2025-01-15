#!/bin/bash
git clone https://aur.archlinux.org/st-git.git && cd st-git || exit 1

wget \
    https://st.suckless.org/patches/sync/st-appsync-20200618-b27a383.diff \
    https://st.suckless.org/patches/scrollback/st-scrollback-20210507-4536f46.diff \
    https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20220127-2c5edf2.diff \
    https://st.suckless.org/patches/scrollback/st-scrollback-mouse-altscreen-20220127-2c5edf2.diff \
    https://st.suckless.org/patches/newterm/st-newterm-0.9.diff \
    https://st.suckless.org/patches/newterm/st-newterm-0.9-tmux.diff \
    https://st.suckless.org/patches/hidecursor/st-hidecursor-0.8.3.diff \
    https://st.suckless.org/patches/copyurl/st-copyurl-multiline-20230406-211964d.diff
wget -O kitty-graphics.diff https://github.com/sergei-grechanik/st-graphics/commit/0b14299b84215ee69870a15374165d0c32e88214.diff
git add . && git commit -m download

git am ../000*.patch

makepkg -s
cp config.def.h config.h
patch < ../99-config.patch
makepkg -Cfi
