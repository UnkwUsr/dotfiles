// ==UserScript==
// @name        wiktionary hide non-Japanese sections if the page is about some Japanese
// @namespace   https://en.wiktionary.org/wiki/*
// @include     https://en.wiktionary.org/wiki/*
// @version     1.0
// @license     MIT
// @run-at      document-end
// @grant       none
// ==/UserScript==

// remove categories at the bottom of the page
setTimeout(function () {
    let elems = document.getElementsByClassName("catlinks");
    // for (x of elems) {
    //     x.hidden = true;
    // }
}, 500);

// will be filled with elements to hide (you don't need to fill it by hands)
let items_to_hide = [];
// will be used to scroll to
let japanese_page_header;

// find sections in header
let headers_list = document.getElementById("toc").children[2].children;
for (li of headers_list) {
    let a = li.children[0];
    let subul = li.children[1];

    if (!a.href.endsWith("#Japanese")) {
        items_to_hide.push(li);
    }
}

// find sections on page
let page_elements =
    document.getElementsByClassName("mw-parser-output")[0].children;
let found_first_header = false;
let current_is_japanese = false;
let japanese_ended = false;
let japanese_found = false;
for (x of page_elements) {
    if (!found_first_header && x.tagName == "H2") {
        found_first_header = true;
        // console.log("first header:", x);
    }
    if (!found_first_header) {
        continue;
    }

    if (current_is_japanese && !japanese_ended && x.tagName == "H2") {
        japanese_ended = true;
        // console.log("first after japanese:", x);
    }

    if (
        !current_is_japanese && x.tagName == "H2" &&
        x.children[0].id == "Japanese"
    ) {
        current_is_japanese = true;
        japanese_page_header = x;
        // console.log("japanese:", x);

        japanese_found = true;
    }

    if (current_is_japanese && !japanese_ended) {
        continue;
    }

    items_to_hide.push(x);
}

if (!japanese_found) {
    // not japanese wiktionary, exit
    return;
}

// create our css style class
var myStyle = document.createElement("style");
myStyle.type = "text/css";
myStyle.innerHTML = ".myStyle { display: none; }";
document.getElementsByTagName("head")[0].appendChild(myStyle);

// actually hide elements
for (x of items_to_hide) {
    x.classList.add("myStyle");
    // x.style["background-color"] = "red";
}

let myStyleState = 0;
function toggleMyStyle() {
    if (myStyleState == 0) {
        myStyle.innerHTML = ".myStyle { background-color: red; }";
        myStyleState = 1;
    } else if (myStyleState == 1) {
        myStyle.innerHTML = ".myStyle {}";
        myStyleState = 2;
    } else if (myStyleState == 2) {
        myStyle.innerHTML = ".myStyle { display: none; }";
        myStyleState = 0;
    }
}

document.addEventListener("keydown", function (e) {
    // alt
    if (!e.shiftKey && !e.ctrlKey && e.altKey && !e.metaKey) {
        // g
        if (e.keyCode == 71) {
            toggleMyStyle();
        } // s
        else if (e.keyCode == 83) {
            japanese_page_header.scrollIntoView();
        }
    }
}, false);
