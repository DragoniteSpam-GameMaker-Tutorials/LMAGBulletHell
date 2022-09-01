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

self.has_been_on_screen = false;

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

self.inheritedOnDamage = self.OnDamage;

self.OnDamage = function(bullet) {
    self.inheritedOnDamage(bullet);
    
    var segment = self;
    for (var i = 1; i < ceil(self.health); i++) {
        segment = segment.next;
    }
    
    while (segment.next) {
        instance_destroy(segment.next);
        var next = segment.next;
        segment.next = undefined;
        segment = next;
    }
};