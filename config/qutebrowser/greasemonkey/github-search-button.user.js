// ==UserScript==
// @name        github search button
// @description Add search field to be used with `gi` bind
// @namespace   *.github.com
// @include     *://github.com/*
// @version     1.0
// @license     MIT
// @run-at      document-idle
// @grant       none
// ==/UserScript==

function myfix() {
    let me = document.getElementsByClassName("js-site-search-type-field")[0];
    if (!me) {
        return;
    }

    // removes type="hidden" attribute
    me.removeAttribute("type");

    me.style = "\
    width: 0px;\
    height: 0;\
    margin-left: 11px;\
    position: absolute;";

    me.onfocus = (_event) => {
        let btn = document.getElementsByClassName("AppHeader-searchButton")[0];
        btn.click();
    };
}

function observer_callback(_mutationList, _observer) {
    myfix();
}

const observer = new MutationObserver(observer_callback);
observer.observe(document.body, {
    childList: true,
});

myfix();
