import qutebrowser.api.interceptor
from qutebrowser.utils import message

YOUTUBE_REDIR = "yewtu.be"
# instances list: https://api.invidious.io

yt_url_replaced = '$(echo "{url}" | sed "s/' + YOUTUBE_REDIR + '/youtube.com/")'
yt_hint_url_replaced = '$(echo "{hint-url}" | sed "s/' + YOUTUBE_REDIR + '/youtube.com/")'  # noqa


def try_redirects(info: qutebrowser.api.interceptor.Request):
    host = info.request_url.host()
    if host not in redirs:
        return

    redir_to = redirs[host]

    if redir_to in [YOUTUBE_REDIR] and info.request_url.scheme() == "https":
        info.request_url.setScheme("http")

    special_handle_short_youtube(info)

    info.request_url.setHost(redir_to)
    message.info("redirect " + host)

    try:
        info.redirect(info.request_url)
    except Exception as e:
        message.error("Redirection exception: " + str(e))
        info.block()
        pass


# problem is in that short urls like youtu.be/videoid badly redirects on some
# invidious instances (seems google doing A/B tests)
# (https://github.com/iv-org/invidious/issues/3933). Here we manually expand
# this links to full format
def special_handle_short_youtube(info):
    host = info.request_url.host()
    if host != "youtu.be":
        return
    # ignoring already valid format
    if info.request_url.path() == "/watch" and info.request_url.hasQuery():
        return

    # convert into full format: youtube.com/watch?v={vid_id}
    vid_id = info.request_url.path()[1:]
    info.request_url.setPath("/watch")
    info.request_url.setQuery("v=" + vid_id)


# more services: https://github.com/pluja/awesome-privacy
# fmt: off
# https://privacydev.net/services.html
# https://farside.link/
redirs = {
    "reddit.com": "redlib.thebunny.zone",
    "www.reddit.com": "redlib.thebunny.zone",
    "www.anilibria.tv": "dl-20220804-91.anilib.top",
    "www.quora.com": "q.opnxng.com",
    "www.pixiv.net": "pixiv.perennialte.ch",
    # nitter instances: https://status.d420.de/
    # https://twiiit.com/
    "x.com": "xcancel.com",
    "twitter.com": "xcancel.com",
    # instances list: https://github.com/realaravinth/libmedium#instances
    # "medium.com": "medium.hostux.net",

    # NOTE: to make youtube redirector work, you should clean service workers:
    # `c.qt.workarounds.remove_service_workers = True`
    "www.youtube.com": YOUTUBE_REDIR,
    "youtube.com": YOUTUBE_REDIR,
    "www.youtube-nocookie.com": YOUTUBE_REDIR,
    "youtube-nocookie.com": YOUTUBE_REDIR,
    # this needs special handle, see special_handle_short_youtube()
    "youtu.be": YOUTUBE_REDIR,
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
