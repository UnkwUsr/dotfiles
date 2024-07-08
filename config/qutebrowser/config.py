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
    "pyconfig/binds/_main.py",
    "pyconfig/settings.py"
    ])
c = c; config = config  # noqa
# fmt: on


redir.init_redirectors()
# workaround to make youtube redirector work
c.qt.workarounds.remove_service_workers = True

config.load_autoconfig(False)
