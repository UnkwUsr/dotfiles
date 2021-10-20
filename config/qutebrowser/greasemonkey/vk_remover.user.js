// ==UserScript==
// @name        vk remover
// @description Remove some things that can't be removed with only css
// @namespace   *.vk.com
// @include     *vk.com*
// @version     1.0
// @license     MIT
// @run-at      document-end
// @grant       none
// ==/UserScript==


// box with prompt to verify phone number
t = document.getElementsByClassName("box_title")
if ( t.length != 0 && t[0].innerHTML == "Keep your account secure") {
    document.getElementsByClassName("box_x_button")[0].click()
}

