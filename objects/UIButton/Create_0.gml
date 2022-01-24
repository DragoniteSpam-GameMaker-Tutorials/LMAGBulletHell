event_inherited();

enabled = true;

Render = function() {
    var subimg = 0;
    Update();
    
    if (enabled) {
        if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x, y, x + sprite_width, y + sprite_height)) {
            self.OnHover();
            subimg = 1;
            if (mouse_check_button_pressed(mb_left)) {
                if (self.sound_on_click != noone) {
                    audio_play_sound(self.sound_on_click, SOUND_PRIORITY_UI, false)
                }
                OnClick();
            }
            GAME.player_cursor_over_ui = true;
        }
    } else {
        subimg = 1;
    }
    
    draw_sprite_stretched_ext(sprite_index, subimg, x, y, sprite_width, sprite_height, color_tint, 1);
    draw_set_font(fnt_game_buttons);
    draw_set_colour(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(x + sprite_width / 2, y + sprite_height / 2, text);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
};

OnClick = function() {
    
};

Update = function() {
    
};

OnHover = function() {
    
};