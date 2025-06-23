// ==UserScript==
// @name        instagram-remover
// @description hide auth window
// @namespace   *.instagram.com
// @include     *instagram.com/*
// @version     1.0
// @license     MIT
// @run-at      document-end
// @grant       none
// ==/UserScript==

function do_stuff() {
    const svg = document.querySelector('svg[aria-label="Close"]');
    if (svg !== null) {
        svg.parentElement.parentElement.click();
    }

    const mute = document.querySelector('button[aria-label="Toggle audio"]');
    if (mute !== null) {
        mute.click();
    } else {
        setTimeout(do_stuff, 500);
    }
}

do_stuff();
