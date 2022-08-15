event_inherited();

self.frames = GameController.foe_meshes.centipede_head;
self.frame_index = 0;
self.animation_speed = 6;

self.Shoot = function() {
    
};

self.can_track_player = false;
call_later(1, time_source_units_seconds, function() {
    self.can_track_player = true;
});

self.active = true;
self.xspeed = 0;
self.yspeed = self.movement_speed;