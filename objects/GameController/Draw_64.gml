if (self.state == GameStates.TITLE) {
    self.ui.RenderUI(self.title_screen);
} else {
    self.ui.RenderUI("UI_Gameplay");
}

if (is_paused()) {
    self.ui.RenderUI(self.pause_screen);
}

if (self.state != GameStates.TITLE) {
    if (self.end_of_level_screen != "") {
        self.ui.RenderUI(self.end_of_level_screen);
    }
}