OnClick = function() {
    Settings.video.frame_rate_index = max(0, Settings.video.frame_rate_index - 1);
    Settings.video.ApplyFPS();
	Settings.Save();
};