OnClick = function() {
    Settings.video.size_index = max(0, Settings.video.size_index - 1);
    Settings.video.ApplyScreenSize();
	Settings.Save();
};