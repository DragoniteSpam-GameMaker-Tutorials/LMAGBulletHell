OnClick = function() {
    Settings.audio.master = min(1, 
        ((Settings.audio.master * 100) + 10) / 100
    );
    Settings.audio.ApplyVolume();
};