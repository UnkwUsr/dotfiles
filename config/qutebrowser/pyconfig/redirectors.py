import qutebrowser.api.interceptor
from qutebrowser.utils import message


def try_redirects(info: qutebrowser.api.interceptor.Request):
    host = info.request_url.host()
    if host not in redirs:
        return

    redir_to = redirs[host]

    info.request_url.setHost(redir_to)
    message.info("redirect " + host)

    try:
        info.redirect(info.request_url)
    except Exception as e:
        message.error("Redirection exception: " + str(e))
        info.block()
        pass




# more services: https://github.com/pluja/awesome-privacy
# fmt: off
# https://privacydev.net/services.html
# https://farside.link/
redirs = {
    "reddit.com": "redlib.thebunny.zone",
    "www.reddit.com": "redlib.thebunny.zone",
    "www.anilibria.tv": "dl-20220804-91.anilib.top",
    "www.quora.com": "q.opnxng.com",
    # nitter instances: https://status.d420.de/
    # https://twiiit.com/
    "x.com": "xcancel.com",
    # instances list: https://github.com/realaravinth/libmedium#instances
    # "medium.com": "medium.hostux.net",
}
# fmt: on


def init_redirectors():
    # remove previous registered interceptor (in case when run :config-source
    # command)
    if hasattr(qutebrowser.api, "redirector_intercept_func"):
        qutebrowser.api.interceptor.interceptors._interceptors.remove(
            qutebrowser.api.redirector_intercept_func
        )

    qutebrowser.api.redirector_intercept_func = try_redirects
    qutebrowser.api.interceptor.register(try_redirects)
    message.info("my redirectors loaded")
