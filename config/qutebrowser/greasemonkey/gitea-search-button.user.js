// ==UserScript==
// @name        codeberg add search field
// @description Add search field (to be used with `gi` bind)
// @namespace   *.codeberg
// @include     *://codeberg.org/*/*
// @version     1.0
// @license     MIT
// @run-at      document-end
// @grant       none
// ==/UserScript==

// TODO: in future have to support all gitea instances. Then match all urls and
// check in js?

const root = document.getElementById("repo-desc");
if (!root) {
    return;
}

const me = document.createElement("input");
me.style = "margin-left: 40px;";
me.placeholder = "Search on issues:";
me.onkeypress = function(e) {
    console.log(e.key);
    if (e.key !== "Enter") {
        return;
    }

    const url = window.location.href + "/";
    let b = url.match(new RegExp(".+:\/\/[^\/]+\/[^\/]+\/[^\/]+\/"));
    window.location.href = b + "issues?q=" + me.value;
};

root.appendChild(me);
