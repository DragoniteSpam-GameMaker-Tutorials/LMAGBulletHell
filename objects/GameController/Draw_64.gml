if (self.state == GameStates.TITLE) {
    self.ui.RenderUI(self.title_screen);
} else {
    self.ui.RenderUI("UI_Gameplay");
}

if (is_paused()) {
    if (self.pause_screen != "") {
        self.ui.RenderUI(self.pause_screen);
    }
}

if (self.countdown_time_source != -1) {
    draw_set_font(fnt_game_huge);
    draw_set_colour(c_white);
    var halign = draw_get_halign();
    var valign = draw_get_valign();
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(surface_get_width(application_surface) / 2, surface_get_height(application_surface) / 2, ceil(time_source_get_time_remaining(self.countdown_time_source)));
    draw_set_halign(halign);
    draw_set_valign(valign);
    draw_set_colour(c_black);
    draw_set_font(fnt_game_buttons);
}

if (self.state != GameStates.TITLE) {
    if (self.end_of_level_screen != "") {
        self.ui.RenderUI(self.end_of_level_screen);
    }
}

with (EntFoeBossTemplate) {
    self.DrawBossUI((window_get_width() - (1366 - room_width)) / 2, 32);
}