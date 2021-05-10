// ==UserScript==
// @name        vk remover
// @description Remove all distracting things (ui elements and chats)
// @namespace   *.vk.com
// @include     *vk.com*
// @version     1.0
// @license     MIT
// @run-at      document-end
// @grant       none
// ==/UserScript==


// remove ui elements

// logo
document.getElementsByClassName("HeaderNav__item--logo")[0].remove()

// side menu buttons
document.getElementById("l_pr").remove()
document.getElementById("l_nwsf").remove()
document.getElementById("l_fr").remove()

// box with prompt to verify phone number
t = document.getElementsByClassName("box_title")
if ( t.length != 0 && t[0].innerHTML == "Keep your account secure") {
    document.getElementsByClassName("box_x_button")[0].click()
}


// remove chats

var st = document.createElement('style');
st.innerHTML = "";

// remove entries in chats list
st.innerHTML += '._im_dialog_2000000011{display:none}';
st.innerHTML += '._im_dialog_2000000018{display:none}';

// remove entries in right block with opened chats
st.innerHTML += '#ui_rmenu_peer_2000000011{display:none}';
st.innerHTML += '#ui_rmenu_peer_2000000018{display:none}';

document.head.appendChild(st);

