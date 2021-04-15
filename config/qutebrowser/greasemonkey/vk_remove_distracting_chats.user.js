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

var st = document.createElement('style');
st.innerHTML = "";

// remove entries in chats list
st.innerHTML += '._im_dialog_2000000011{display:none}';
st.innerHTML += '._im_dialog_2000000018{display:none}';

// remove entries in right block with opened chats
st.innerHTML += '#ui_rmenu_peer_2000000011{display:none}';
st.innerHTML += '#ui_rmenu_peer_2000000018{display:none}';

document.body.appendChild(st);

