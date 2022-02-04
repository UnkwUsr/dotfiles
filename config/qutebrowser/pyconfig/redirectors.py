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

redirs = {
        "reddit.com": "teddit.net",
        "www.reddit.com": "teddit.net",
        "twitter.com": "nitter.net",
        "imgur.com": "imgin.voidnet.tech",

        # NOTE: to make youtube redirector work, you should clean service workers
        "www.youtube.com": "invidious.snopyta.org",
        "youtube.com": "invidious.snopyta.org",
        "youtu.be": "invidious.snopyta.org",
        }

# remove previous registered interceptor (in case when run :config-source
# command)
if hasattr(qutebrowser.api, "redirector_intercept_func"):
    qutebrowser.api.interceptor.interceptors._interceptors.remove(qutebrowser.api.redirector_intercept_func)

qutebrowser.api.redirector_intercept_func = try_redirects
qutebrowser.api.interceptor.register(try_redirects)
message.info("my redirectors loaded")
