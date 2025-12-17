// ==UserScript==
// @name        wikipedia show lang buttons on sidebar
// @include     https://en.wikipedia.org/wiki/*
// @include     https://uk.wikipedia.org/wiki/*
// @include     https://ja.wikipedia.org/wiki/*
// @version     1.0
// @license     MIT
// @run-at      document-end
// @grant       none
// ==/UserScript==

const my_section = document.createElement("nav");
my_section.style = "margin-left: 50px;";

const my_langs = ["ru", "ja", "uk"];
for (const lang of my_langs) {
    const el = document.getElementsByClassName("interwiki-" + lang)[0];
    if (el === undefined) {
        continue;
    }

    my_section.appendChild(el);
    el.style = "list-style: none;";
}

// add my section to sidebar
const sidebar =
    document.getElementsByClassName("vector-sticky-pinned-container")[1];
sidebar.appendChild(my_section);
