event_inherited();

self.last_shot_angle = 180;
self.shot_angle_direction = 10;

self.OnHPStageChange = function() {
    self.interstage_cooldown = DEFAULT_BOSS_STAGE_COOLDOWN;
    switch (self.hp_stage) {
        case 1:
            self.last_shot_angle = 180;
            self.shot_angle_direction = 10;
            break;
        case 2:
            self.last_shot_angle = 180;
            self.shot_angle_direction = 15;
            break;
    }
};

self.Shoot = function() {
    if (self.interstage_cooldown > 0) return;
    switch (self.hp_stage) {
        case 0:
            var shot_count = 10;
            var fan_start = 180;
            var fan_end = 360;
            var shot_velocity = 80;
            self.shots_per_second = 1;
            for (var i = fan_start; i <= fan_end; i += (fan_end - fan_start) / shot_count) {
                var shot = instance_create_depth(self.x, self.y, self.depth + 1, self.default_bullet_type);
                var shot_angle = i;
                shot.xspeed =  shot_velocity * dcos(shot_angle);
                shot.yspeed = -shot_velocity * dsin(shot_angle);
            }
            break;
        case 1:
            self.shots_per_second = 3.5;
            var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
            var shot_velocity = 120;
            shot.xspeed =  shot_velocity * dcos(self.last_shot_angle);
            shot.yspeed = -shot_velocity * dsin(self.last_shot_angle);
            self.last_shot_angle += self.shot_angle_direction;
            if (self.last_shot_angle >= 360 || self.last_shot_angle < 180) {
                self.shot_angle_direction = -self.shot_angle_direction;
            }
            break;
        case 2:
            // bullets that spawn more bullets at intervals
            break;
        case 3:
            self.shots_per_second = 4;
            var shot_velocity = 120;
            
            var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
            shot.xspeed =  shot_velocity * dcos(self.last_shot_angle);
            shot.yspeed = -shot_velocity * dsin(self.last_shot_angle);
            
            var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
            shot.xspeed = -shot_velocity * dcos(self.last_shot_angle);
            shot.yspeed = -shot_velocity * dsin(self.last_shot_angle);
            
            self.last_shot_angle += self.shot_angle_direction;
            if (self.last_shot_angle >= 360 || self.last_shot_angle < 180) {
                self.shot_angle_direction = -self.shot_angle_direction;
            }
            break;
    }
    
    self.shot_enabled = false;
    self.SetTimer(1 / self.shots_per_second, function() {
        self.shot_enabled = true;
    });
};