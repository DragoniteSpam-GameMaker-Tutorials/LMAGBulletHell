self.ui.RenderUI("UI_Gameplay");

if (is_paused()) {
    self.ui.RenderUI(self.pause_screen);
}