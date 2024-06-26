1. Clone [st](https://aur.archlinux.org/packages/st) (aur package). (latest
   tested aur package commit `eee6c3b` (st version `0.9.2`))
2. Download patches list: `wget -i patches.urls`
3. Apply my custom patch to fix conflicts between patches and adapt PKGBUILD:
   `patch < fix-patches.patch`
4. Make first build to generate `config.def.h`: `makepkg -s`
5. Copy `config.def.h` to `config.h` and modify font name and size.
6. Build again and install: `makepkg -fi`
