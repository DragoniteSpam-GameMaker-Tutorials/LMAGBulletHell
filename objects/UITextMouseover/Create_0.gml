event_inherited();

text = "";

Render = function() {
    var subimg = 0;
    
    GetText();
    
    if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x, y, x + sprite_width, y + sprite_height)) {
        self.OnHover();
    }
    
    draw_sprite_stretched(sprite_index, subimg, x, y, sprite_width, sprite_height);
    draw_set_font(fnt_game_buttons);
    draw_set_colour(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_ext(x + sprite_width / 2, y + sprite_height / 2, text, -1, sprite_width - 32);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    self.text = "";
}

GetText = function() {
    if (self.text = "") self.text = L(self.source_text);
}

OnHover = function() {
    
};