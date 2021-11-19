event_inherited();

var distance_to_target = point_distance(self.x, self.y, mouse_x, mouse_y);
var direction_to_target = point_direction(self.x, self.y, mouse_x, mouse_y);
var distance_to_move = min(self.movement_speed, distance_to_target);
self.x += distance_to_move * dcos(direction_to_target);
self.y -= distance_to_move * dsin(direction_to_target);

if (mouse_check_button(mb_left)) {
    if (self.last_shot_time + 1 / self.shots_per_second <= current_time / 1000) {
        var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
        var shot_velocity = 10;
        var shot_angle = 90 + random_range(-self.bullet_spread / 2, self.bullet_spread / 2);
        shot.xspeed =  shot_velocity * dcos(shot_angle);
        shot.yspeed = -shot_velocity * dsin(shot_angle);
        shot.friendly = true;
        self.last_shot_time = current_time / 1000;
    }
}