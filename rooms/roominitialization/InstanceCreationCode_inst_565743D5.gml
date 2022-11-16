Update = function() {
    self.text = L("Fullscreen: %0", window_get_fullscreen() ? L("On") : L("Off"));
};

OnClick = function() {
    window_set_fullscreen(!window_get_fullscreen());
	Settings.Save();
};