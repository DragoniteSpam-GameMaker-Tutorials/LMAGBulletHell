OnClick = function() {
    Settings.video.scale_index = max(0, Settings.video.scale_index - 1);
    Settings.video.ApplyScale();
};