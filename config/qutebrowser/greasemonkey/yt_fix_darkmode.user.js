// ==UserScript==
// @name        fix yt darkmode
// @description Fix qutebrowser darkmode on youtube, remove in-video bottom white gradient
// @namespace   *.youtube.com
// @include     *youtube.com/*
// @version     1.0
// @license     MIT
// @run-at      document-end
// @grant       none
// ==/UserScript==

let main = new MutationObserver(() => {
    if(document.querySelector(".html5-video-player").isFullscreen()) {
        document.getElementsByClassName("ytp-gradient-bottom")[0].style["background-image"] = "linear-gradient(transparent, white)";
        document.getElementsByClassName("ytp-gradient-top")[0].style["background-image"] = "linear-gradient(white, transparent)";
    } else {
        document.getElementsByClassName("ytp-gradient-bottom")[0].style["background-image"] = "linear-gradient(transparent, black)";
    }
})

main.observe(document.querySelector('.html5-video-player'), {attributes: true, characterData: true, childList: true})
