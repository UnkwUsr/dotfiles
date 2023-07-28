import qutebrowser.api.interceptor
from qutebrowser.utils import message

# instances list: https://api.invidious.io
YOUTUBE_REDIR = "yewtu.be"


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
redirs = {
    "reddit.com": "teddit.net",
    "www.reddit.com": "teddit.net",
    "twitter.com": "nitter.cz",
    "imgur.com": "imgin.voidnet.tech",
    "www.quora.com": "quetre.iket.me",
    # instances list: https://github.com/realaravinth/libmedium#instances
    "medium.com": "medium.hostux.net",

    # NOTE: to make youtube redirector work, you should clean service workers
    "www.youtube.com": YOUTUBE_REDIR,
    "youtube.com": YOUTUBE_REDIR,
    "youtu.be": YOUTUBE_REDIR,
}

# remove previous registered interceptor (in case when run :config-source
# command)
if hasattr(qutebrowser.api, "redirector_intercept_func"):
    qutebrowser.api.interceptor.interceptors._interceptors.remove(
        qutebrowser.api.redirector_intercept_func)

qutebrowser.api.redirector_intercept_func = try_redirects
qutebrowser.api.interceptor.register(try_redirects)
message.info("my redirectors loaded")
