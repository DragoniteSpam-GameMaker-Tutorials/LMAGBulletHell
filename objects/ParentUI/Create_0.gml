offset_x = 0;
offset_y = 0;

switch (anchor_horizontal) {
    case fa_left:
        offset_x = x;
        break;
    case fa_right:
        offset_x = room_width - x;
        break;
    case fa_center:
        offset_x = x - (room_width / 2);
        break;
}

switch (anchor_vertical) {
    case fa_top:
        offset_y = y;
        break;
    case fa_bottom:
        offset_y = room_height - y;
        break;
    case fa_middle:
        offset_y = y - (room_height / 2);
        break;
}