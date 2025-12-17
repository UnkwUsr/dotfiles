// ==UserScript==
// @name        ru wikipedia hide sidebar to have easy access to languages
// @include     https://ru.wikipedia.org/wiki/*
// @version     1.0
// @license     MIT
// @run-at      document-end
// @grant       none
// ==/UserScript==

const sidebar = document.getElementsByClassName("vector-legacy-sidebar")[0];
// sidebar.querySelector("#p-logo").remove();
// sidebar.querySelector("#p-tb").remove();
sidebar.querySelector("#p-navigation").remove();
sidebar.querySelector("#p-participation").remove();
sidebar.querySelector("#p-wikibase-otherprojects").remove();
sidebar.querySelector("#p-coll-print_export").remove();
