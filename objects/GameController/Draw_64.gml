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
    var halign = draw_get_halign();
    var valign = draw_get_valign();
    var c = draw_get_colour();
    
    var tsw = 256;
    var tsh = 256;
    
    var text_surface = surface_create(tsw, tsh);
    surface_set_target(text_surface);
    draw_clear_alpha(c_black, 0);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_colour(c_black);
    draw_text(tsw / 2, tsh / 2, ceil(time_source_get_time_remaining(self.countdown_time_source)));
    draw_set_halign(halign);
    draw_set_valign(valign);
    draw_set_colour(c);
    draw_set_font(fnt_game_buttons);
    surface_reset_target();
    
    var sx = surface_get_width(application_surface) / 2 - tsw / 2;
    var sy = surface_get_height(application_surface) / 2 - tsh / 2;
    shader_set(shd_outline);
    shader_set_uniform_f(shader_get_uniform(shd_outline, "texSize"), tsw, tsh);
    draw_surface(text_surface, sx, sy);
    shader_reset();
    
    draw_surface(text_surface, sx, sy);
    
    surface_free(text_surface);
}

if (self.state != GameStates.TITLE) {
    if (self.end_of_level_screen != "") {
        self.ui.RenderUI(self.end_of_level_screen);
    }
}

with (EntFoeBossTemplate) {
    self.DrawBossUI((window_get_width() - (1366 - room_width)) / 2, 32);
}