event_inherited();

self.frames = GameController.foe_meshes.pillbug;
self.frame_index = 0;
self.animation_speed = 3;

self.face_direction = 0;

self.Shoot = function() {
    
};

self.Die = function() {
    repeat (self.shot_density) {
        var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
        var shot_velocity = self.shot_velocity;
        var shot_angle = random(360);
        shot.xspeed =  shot_velocity * dcos(shot_angle);
        shot.yspeed = -shot_velocity * dsin(shot_angle);
    }
    instance_destroy();
    
    audio_play_foe_die();
};