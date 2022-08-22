event_inherited();

self.Shoot = function() {
    switch (self.hp_stage) {
        case 0:
            var shot_count = 8;
            var fan_start = 210;
            var fan_end = 330;
            for (var i = fan_start; i <= fan_end; i += (fan_end - fan_start) / shot_count) {
                var shot = instance_create_depth(self.x, self.y, self.depth + 1, self.default_bullet_type);
                var shot_velocity = self.shot_velocity;
                var shot_angle = i;
                shot.xspeed =  shot_velocity * dcos(shot_angle);
                shot.yspeed = -shot_velocity * dsin(shot_angle);
            }
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            break;
    }
    
    self.shot_enabled = false;
    self.SetTimer(1 / self.shots_per_second, function() {
        self.shot_enabled = true;
    });
};