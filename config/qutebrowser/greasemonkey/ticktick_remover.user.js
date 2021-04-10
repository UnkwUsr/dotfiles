// ==UserScript==
// @name        tick-tick remove reminder about subscription
// @description Remove reminder about subscription due to too have lists more than 9
// @namespace   *.ticktick.com
// @include     *ticktick.com/*
// @version     1.0
// @license     MIT
// @run-at      document-start
// @grant       none
// ==/UserScript==

c = 0
a = document.getElementsByClassName("desc-wrapper")
b = document.getElementsByClassName("pop-tip tip-transition clearfix")

intervalid = setInterval(() => {
    // alert()
    if ( a.length != 0 && a[0].children[0].innerHTML.startsWith("Sorry, you've reached")) {
        a[0].remove()

        c++
    }
    if(b.length != 0 && b[0].children[0].innerHTML == "Upgrade Now") {
        b[0].remove()

        c++
    }
    if(c == 2)
        clearInterval(intervalid)
}, 100)
