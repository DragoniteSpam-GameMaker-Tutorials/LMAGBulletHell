OnClick = function() {
    Settings.audio.se = max(0, 
        ((Settings.audio.se * 100) - 10) / 100
    );
    Settings.audio.ApplyVolume();
	Settings.Save();
};