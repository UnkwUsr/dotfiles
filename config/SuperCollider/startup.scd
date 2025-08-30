// start superdirt, audio engine for tidalcycles
SuperDirt.start;
// installing:
// include("SuperDirt");

// load my samples
s.waitForBoot {
    ~dirt.loadSoundFiles("~/Files/annexes/noise/resources/samples/_tidal/*");
    // ~dirt.loadSoundFiles("~/.steam/steam/steamapps/common/Half-Life/valve/sound/*");
};

// for livecoding, simlessly update synths on the go. This allows doing ~a.play
// once and the modifying reassigning it like ~a = { SinOsc.ar } and it will
// update without cruckle
p = ProxySpace.new.push;
