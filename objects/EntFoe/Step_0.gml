event_inherited();

if (true) {
    if (self.last_shot_time + 1 / self.shots_per_second <= current_time / 1000) {
        var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
        var shot_velocity = self.shot_velocity;
        var shot_angle = 270 + random_range(-self.bullet_spread / 2, self.bullet_spread / 2);
        shot.xspeed =  shot_velocity * dcos(shot_angle);
        shot.yspeed = -shot_velocity * dsin(shot_angle);
        self.last_shot_time = current_time / 1000;
    }
}