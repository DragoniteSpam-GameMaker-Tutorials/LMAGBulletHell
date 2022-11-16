OnClick = function() {
    Settings.video.size_index = min(array_length(Settings.video.default_screen_sizes) - 1, Settings.video.size_index + 1);
    Settings.video.ApplyScreenSize();
	Settings.Save();
};