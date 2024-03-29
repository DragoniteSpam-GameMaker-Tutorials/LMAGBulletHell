event_inherited();

self.Shoot = function() {
    self.Die();
};

self.Die = function() {
    repeat (self.shot_density) {
        var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet, {
            sprite_index: spr_bullet_friendly_fire,
            friendly: -1,
        });
        var shot_velocity = self.shot_velocity;
        var shot_angle = random(360);
        shot.xspeed =  shot_velocity * dcos(shot_angle);
        shot.yspeed = -shot_velocity * dsin(shot_angle);
    }
    instance_destroy();
    
    audio_play_explosion();
};