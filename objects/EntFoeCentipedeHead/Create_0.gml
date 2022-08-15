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

self.spacing = 24;
self.next = undefined;
self.tail = self.id;
self.index = 0;
for (var i = 0; i < self.health_max - 1; i++) {
    var segment = instance_create_depth(self.tail.x, self.tail.y - self.spacing, self.depth, EntFoeCentipedeSegment, {
        index: i + 1,
        head: self.id,
        next: undefined,
    });
    self.tail.next = segment;
    self.tail = segment;
}