event_inherited();

self.last_shot_angle = 270;

self.Shoot = function() {
    var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
    var shot_velocity = self.shot_velocity;
    shot.xspeed =  shot_velocity * dcos(self.last_shot_angle);
    shot.yspeed = -shot_velocity * dsin(self.last_shot_angle);
    self.last_shot_angle += 10;
    self.last_shot_angle %= 360;
    
    self.shot_enabled = false;
    self.SetTimer(1 / self.shots_per_second, function() {
        self.shot_enabled = true;
    });
    
    audio_play_foe_shoot();
};