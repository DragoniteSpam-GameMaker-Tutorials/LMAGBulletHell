event_inherited();

self.Shoot = function() {
    switch (self.hp_stage) {
        case 0:
            var shot_count = 6;
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
            var shot_count = 28;
            var shot_velocity = self.shot_velocity;
            for (var i = 0; i < 360; i += 360 / shot_count) {
                var shot = instance_create_depth(self.x, self.y, self.depth + 1, self.default_bullet_type);
                var shot_velocity = shot_velocity;
                var shot_angle = i;
                shot.xspeed =  shot_velocity * dcos(shot_angle);
                shot.yspeed = -shot_velocity * dsin(shot_angle);
            }
            break;
        case 2:
            var shot_count = 28;
            var shot_velocity = 240;
            repeat (shot_count) {
                var target = EntPlayer.id;
                var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
                var shot_angle = point_direction(self.x, self.y, target.x, target.y) + random_range(-self.bullet_spread / 2, self.bullet_spread / 2);
                shot.xspeed =  shot_velocity * dcos(shot_angle);
                shot.yspeed = -shot_velocity * dsin(shot_angle);
            }
            break;
        case 3:
            var shot_count = 12;
            var shot_velocity = 320;
            var bullet_spread = 30;
            repeat (shot_count) {
                var target = EntPlayer.id;
                var shot = instance_create_depth(self.x, self.y, self.depth + 1, BulletHoming);
                var shot_angle = point_direction(self.x, self.y, target.x, target.y) + random_range(-bullet_spread / 2, bullet_spread / 2);
                shot.xspeed =  shot_velocity * dcos(shot_angle);
                shot.yspeed = -shot_velocity * dsin(shot_angle);
            }
            break;
    }
    
    self.shot_enabled = false;
    self.SetTimer(1 / self.shots_per_second, function() {
        self.shot_enabled = true;
    });
};