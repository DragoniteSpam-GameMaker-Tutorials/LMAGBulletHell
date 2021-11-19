//event_inherited();

if (true) {
    if (self.last_shot_time + 1 / self.shots_per_second <= current_time / 1000) {
        var number_of_shots = 8;
        for (var i = 0; i < 360; i += 360 / number_of_shots) {
            show_debug_message(i)
            var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
            var shot_velocity = self.shot_velocity;
            var shot_angle = i;
            shot.xspeed =  shot_velocity * dcos(shot_angle);
            shot.yspeed = -shot_velocity * dsin(shot_angle);
        }
        self.last_shot_time = current_time / 1000;
    }
}