switch (anchor_horizontal) {
    case fa_left:
        x = offset_x;
        break;
    case fa_right:
        x = window_get_width() - offset_x;
        break;
    case fa_center:
        x = offset_x + (window_get_width() / 2);
        break;
}

switch (anchor_vertical) {
    case fa_left:
        y = offset_y;
        break;
    case fa_right:
        y = window_get_height() - offset_y;
        break;
    case fa_center:
        y = offset_y + (window_get_height() / 2);
        break;
}