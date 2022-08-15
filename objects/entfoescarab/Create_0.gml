event_inherited();

self.frames = GameController.foe_meshes.scarab;
self.frame_index = 0;
self.animation_speed = 3;

self.score = 25;

self.Shoot = function() {
    for (var i = 0; i < 360; i += 360 / self.shot_density) {
        var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
        var shot_velocity = self.shot_velocity;
        var shot_angle = i;
        shot.xspeed =  shot_velocity * dcos(shot_angle);
        shot.yspeed = -shot_velocity * dsin(shot_angle);
    }
    
    self.shot_enabled = false;
    self.SetTimer(1 / self.shots_per_second, function() {
        self.shot_enabled = true;
    });
};