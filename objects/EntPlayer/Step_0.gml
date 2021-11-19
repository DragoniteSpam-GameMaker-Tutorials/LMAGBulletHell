if (point_distance(self.x, self.y, mouse_x, mouse_y) <= self.movement_speed) {
    self.x = mouse_x;
    self.y = mouse_y;
} else {
    move_towards_point(mouse_x, mouse_y, self.movement_speed);
}

if (mouse_check_button(mb_left)) {
    if (self.last_shot_time + 1 / self.shots_per_second <= current_time / 1000) {
        var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
        var shot_velocity = 10;
        var shot_angle = 90 + random_range(-self.bullet_spread / 2, self.bullet_spread / 2);
        shot.xspeed =  shot_velocity * dcos(shot_angle);
        shot.yspeed = -shot_velocity * dsin(shot_angle);
        self.last_shot_time = current_time / 1000;
    }
}