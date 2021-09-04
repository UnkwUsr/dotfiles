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
b = document.getElementsByClassName("pop-tip tip-transition clearfix")

intervalid = setInterval(() => {
    // alert()
    a = document.getElementById("left-bottom-view")
    if ( a !== null && a.children[0].children[0].children[0].children[0].innerHTML.startsWith("Sorry, you've reached")) {
        a.remove()
        document.getElementsByClassName("lists")[0].style["padding-bottom"] = ""

        c++
    }
    if(b.length != 0 && b[0].children[0].innerHTML == "Upgrade Now") {
        b[0].remove()

        c++
    }
    if(c == 2)
        clearInterval(intervalid)
}, 100)
