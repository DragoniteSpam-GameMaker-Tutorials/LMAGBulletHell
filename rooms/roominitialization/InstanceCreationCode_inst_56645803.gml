OnClick = function() {
    Settings.audio.master = max(0, 
        ((Settings.audio.master * 100) - 10) / 100
    );
    Settings.audio.ApplyVolume();
	Settings.Save();
};