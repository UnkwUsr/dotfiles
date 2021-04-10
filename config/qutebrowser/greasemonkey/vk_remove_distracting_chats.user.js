// ==UserScript==
// @name        vk remove distracting chats
// @description Remove distracting chats
// @namespace   *.vk.com
// @include     *vk.com/im*
// @version     1.0
// @license     MIT
// @run-at      document-end
// @grant       none
// ==/UserScript==

document.getElementsByClassName("_im_dialog_2000000011")[0].style['display'] = 'none'
document.getElementsByClassName("_im_dialog_2000000018")[0].style['display'] = 'none'
