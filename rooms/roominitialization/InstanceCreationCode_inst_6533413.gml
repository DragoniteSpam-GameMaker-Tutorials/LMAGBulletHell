OnClick = function() {
    Settings.video.scale_index = min(array_length(Settings.video.default_scales) - 1, Settings.video.scale_index + 1);
    Settings.video.ApplyScale();
};