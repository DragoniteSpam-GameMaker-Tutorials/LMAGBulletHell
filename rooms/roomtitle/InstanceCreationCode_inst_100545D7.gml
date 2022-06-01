OnClick = function() {
    Settings.audio.bgm = min(1, 
        ((Settings.audio.bgm * 100) + 10) / 100
    );
    Settings.audio.ApplyVolume();
};