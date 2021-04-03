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

document.getElementsByClassName("ytp-gradient-bottom")[0].remove()
