event_inherited();

var distance_to_target = point_distance(self.x, self.y, mouse_x, mouse_y);
var direction_to_target = point_direction(self.x, self.y, mouse_x, mouse_y);
var distance_to_move = min(self.movement_speed, distance_to_target);
self.x += distance_to_move * dcos(direction_to_target);
self.y -= distance_to_move * dsin(direction_to_target);

if (mouse_check_button(mb_left)) {
    if (self.CanShoot()) {
        self.Shoot();
    }
}

if ((self.iframe_time + self.iframe_duration) > (current_time / 1000)) {
    self.sprite_index = spr_player_iframes;
} else {
    self.sprite_index = spr_player;
}