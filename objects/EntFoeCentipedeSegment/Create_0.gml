event_inherited();

self.frames = GameController.foe_meshes.centipede_body;
self.frame_index = 0;
self.animation_speed = 4;

self.Shoot = function() {
    
};

self.OnDamage = function(bullet) {
    self.head.OnDamage(bullet);
};