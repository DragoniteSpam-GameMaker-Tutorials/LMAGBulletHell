var ww = self.adjust_with_gameplay_ui ? GameController.pseudo_window_width : window_get_width();
var hh = self.adjust_with_gameplay_ui ? GameController.pseudo_window_height : window_get_height();

switch (anchor_horizontal) {
    case fa_left:
        x = offset_x;
        break;
    case fa_right:
        x = ww - offset_x;
        break;
    case fa_center:
        x = offset_x + (ww / 2);
        break;
}

switch (anchor_vertical) {
    case fa_left:
        y = offset_y;
        break;
    case fa_right:
        y = hh - offset_y;
        break;
    case fa_center:
        y = offset_y + (hh / 2);
        break;
}

// if you need a horizontal fill for whatever reason, just do the equivalent

if (self.adjust_fill_vertical) {
    self.image_yscale = hh / sprite_get_height(self.sprite_index);
}