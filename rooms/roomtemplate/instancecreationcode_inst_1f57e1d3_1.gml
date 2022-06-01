OnClick = function() {
    Settings.video.frame_rate_index = min(array_length(Settings.video.default_frame_rates) - 1, Settings.video.frame_rate_index + 1);
    Settings.video.ApplyFPS();
};