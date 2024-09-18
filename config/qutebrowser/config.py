import os
from pathlib import Path

import pyconfig.redirectors as redir


def exec_config_subfiles(files):
    # change dir to config directory
    os.chdir(Path(__file__).parent)
    for f in files:
        exec(open(f).read())
    # restore after change dir
    os.chdir(Path.home())


# fmt: off
exec_config_subfiles([
    "pyconfig/settings.py",
    "pyconfig/binds/better_defaults.py",
    "pyconfig/binds/external.py",
    "pyconfig/binds/utils.py"
    ])
c = c; config = config  # noqa
# fmt: on


redir.init_redirectors()

config.load_autoconfig(False)
