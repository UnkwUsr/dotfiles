// ==UserScript==
// @name         No ADS - YouTube
// @namespace    http://tampermonkey.net/
// @version      1.1
// @description  - Skips all youtube ads - | - undetectable - | - skips ads instantly -
// @author       GSRHackZ (+ me (UnkwUsr) edited)
// @match        https://www.youtube.com/*
// @grant        none
// ==/UserScript==
let is_pbrboost = false;
let vid;
let count = 0;
const COUNT_MAX = 7;

let intervalId = setInterval(function(){
    // console.log(count)
    if(vid!==undefined){
        // vid.muted = true;
        // vid.play();

        let ad = document.getElementsByClassName("video-ads ytp-ad-module")[0];
        let closeAble = document.getElementsByClassName("ytp-ad-overlay-close-button");
        for(let i=0;i<closeAble.length;i++){
            closeAble[i].click();
            console.log("ad banner closed!")
        }
        if(document.getElementsByClassName("style-scope ytd-watch-next-secondary-results-renderer sparkles-light-cta GoogleActiveViewElement")[0]!==undefined){
            let sideAd=document.getElementsByClassName("style-scope ytd-watch-next-secondary-results-renderer sparkles-light-cta GoogleActiveViewElement")[0];
            sideAd.style.display="none";
            console.log("side ad removed!")
        }
        if(document.getElementsByClassName("ytp-ad-text ytp-ad-skip-button-text")[0]!==undefined){
            let skipBtn=document.getElementsByClassName("ytp-ad-text ytp-ad-skip-button-text")[0];
            skipBtn.click();
            console.log("skippable ad skipped!")
        }
        if(document.getElementsByClassName("ytp-ad-message-container")[0]!==undefined){
            let incomingAd=document.getElementsByClassName("ytp-ad-message-container")[0];
            incomingAd.style.display="none";
            console.log("removed incoming ad alert!")
        }
        if(document.getElementsByClassName("style-scope ytd-companion-slot-renderer")[0]!==undefined){
            document.getElementsByClassName("style-scope ytd-companion-slot-renderer")[0].remove();
            console.log("side ad removed!")
        }
        if(ad!==undefined){
            if(ad.children.length>0){
                vid.playbackRate=16;
                vid.muted = true;
                is_pbrboost = true;
                console.log("Incrementally skipped unskippable ad!")
            }
            else{
                if(is_pbrboost) {
                    vid.playbackRate=1;
                    vid.muted = false;
                    is_pbrboost = false;
                }
            }
        }

        // count += 1;
        // if (count > COUNT_MAX) {
        //     clearInterval(intervalId);
        //     vid.muted = false;
        //     vid.pause();
        // }
    }
    else {
        vid = document.getElementsByClassName("video-stream html5-main-video")[0];
    }
},100)


// side ad
let sideintervalId = setInterval(function(){
    let ad = document.getElementsByClassName("video-ads ytp-ad-module")[0];
    let closeAble = document.getElementsByClassName("ytp-ad-overlay-close-button");
    for(let i=0;i<closeAble.length;i++){
        closeAble[i].click();
        console.log("ad banner closed!")
    }
    if(document.getElementsByClassName("style-scope ytd-watch-next-secondary-results-renderer sparkles-light-cta GoogleActiveViewElement")[0]!==undefined){
        let sideAd=document.getElementsByClassName("style-scope ytd-watch-next-secondary-results-renderer sparkles-light-cta GoogleActiveViewElement")[0];
        sideAd.style.display="none";
        console.log("side ad removed!")
    }
    if(document.getElementsByClassName("style-scope ytd-companion-slot-renderer")[0]!==undefined){
        document.getElementsByClassName("style-scope ytd-companion-slot-renderer")[0].remove();
        console.log("side ad removed!")
    }

    count += 1;
    if (count > 50) {
        clearInterval(sideintervalId);
    }
},100)

// setTimeout(function() {
//     let vida = document.getElementsByClassName("video-stream html5-main-video")[0];
//     vid.muted = true;
//     vida.play();
//     setTimeout(function() {
//         let vida = document.getElementsByClassName("video-stream html5-main-video")[0];
//         vid.muted = false;
//         vida.pause();
//     }, 200)
// }, 1000);

