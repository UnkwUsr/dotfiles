// ==UserScript==
// @name        autologin quantom
// @namespace   asd
// @include     https://*
// @version     1.0
// @license     MIT
// @run-at      document-end
// @grant       none
// ==/UserScript==

// this is for cases when can't use regular css because it would affect other
// sites

if (window.location.hostname == "paulgraham.com") {
    document.body.background = "";
    document.body.setAttribute("bgcolor", "#000000");
}
