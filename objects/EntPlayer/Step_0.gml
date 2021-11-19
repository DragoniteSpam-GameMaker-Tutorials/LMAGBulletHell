if (point_distance(self.x, self.y, mouse_x, mouse_y) <= self.movement_speed) {
    self.x = mouse_x;
    self.y = mouse_y;
} else {
    move_towards_point(mouse_x, mouse_y, self.movement_speed);
}

if (mouse_check_button_pressed(mb_left)) {
    instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
}