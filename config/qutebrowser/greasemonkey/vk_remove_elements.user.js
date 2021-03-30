// ==UserScript==
// @name        vk remove elements
// @description Remove unneded elements on page
// @namespace   *.vk.com
// @include     *vk.com/*
// @version     1.0
// @license     MIT
// @run-at      document-end
// @grant       none
// ==/UserScript==

// logo
document.getElementsByClassName("HeaderNav__item--logo")[0].remove()

// side menu buttons
document.getElementById("l_pr").remove()
document.getElementById("l_nwsf").remove()
document.getElementById("l_fr").remove()
