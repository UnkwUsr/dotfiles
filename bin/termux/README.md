Termux ignores symlinks in shortcuts folder, so we have to hack it by creating
wrapper scripts using next command:

```shell
mkdir -p ~/shortcuts \
    && fd . ~/.dotfiles/bin/termux --exec sh -c "echo {} > ~/.shortcuts/{/}"
```
