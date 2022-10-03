event_inherited();

self.frames = GameController.foe_meshes.scorpion;
self.frame_index = 0;
self.animation_speed = 3;

self.score = 25;

self.Shoot = function() {
    var dist = distance_to_object(EntPlayer);
    repeat (self.shot_density) {
        var shot_angle = point_direction(self.x, self.y, EntPlayer.x, EntPlayer.y) + random_range(-self.bullet_spread / 2, self.bullet_spread / 2);
        var shot_velocity = self.shot_velocity;
        var bullet = instance_create_depth(self.x, self.y, self.depth + 1, Bullet, {
            xspeed:  shot_velocity * dcos(shot_angle),
            yspeed: -shot_velocity * dsin(shot_angle),
        });
    }
    
    var falloff = max(1, dist / self.player_threshold);
    
    self.shot_enabled = false;
    self.SetTimer(falloff / self.shots_per_second, function() {
        self.shot_enabled = true;
    });
    
    audio_play_foe_shoot();
};