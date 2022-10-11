if (keyboard_check_pressed(vk_escape)) {
    if (self.state == GameStates.PLAYING) {
        self.Pause();
    } else if (room == RoomTitle) {
        // we can assume we're showing the settings menu
        GameController.title_screen = "UI_Level_Select";
    } else {
        self.Unpause();
    }
}

if (self.state == GameStates.PLAYING) {
    self.level.ScrollBackground();
    self.level.Update();
    part_system_update(Particles.system);
    
    if (!window_has_focus()) self.Pause();
}

if (self.state == GameStates.TITLE) {
    self.pseudo_window_width = window_get_width();
    self.pseudo_window_height = window_get_height();
} else {
    self.pseudo_window_width = window_get_width() - inst_game_background.sprite_width;
    self.pseudo_window_height = window_get_height();
}