// start superdirt, audio engine for tidalcycles
SuperDirt.start;

// load my samples
s.waitForBoot {
    ~dirt.loadSoundFiles("~/Projects/noise/resources/samples/_tidal/*");
    // ~dirt.loadSoundFiles("~/.steam/steam/steamapps/common/Half-Life/valve/sound/*");
}
