// start superdirt, audio engine for tidalcycles
SuperDirt.start;
// installing:
// include("SuperDirt");

// load my samples
s.waitForBoot {
    ~dirt.loadSoundFiles("~/Files/annexes/noise/resources/samples/_tidal/*");
    // ~dirt.loadSoundFiles("~/.steam/steam/steamapps/common/Half-Life/valve/sound/*");
};
