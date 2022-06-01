OnClick = function() {
    Settings.audio.bgm = max(0, 
        ((Settings.audio.bgm * 100) - 10) / 100
    );
    Settings.audio.ApplyVolume();
};