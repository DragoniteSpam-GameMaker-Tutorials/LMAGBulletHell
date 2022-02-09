OnClick = function() {
    Settings.audio.se = min(1, 
        ((Settings.audio.se * 100) + 10) / 100
    );
};