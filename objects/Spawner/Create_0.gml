self.Spawn = function() {
    if (!self.alive) return;
    if (self.spawn_count <= 0) {
        instance_destroy();
        return;
    }
    instance_create_depth(random_range(32, room_width - 32), random_range(-128, -32), 0, self.foe_type);
    self.spawn_count--;
    call_later(1 / self.spawn_rate, time_source_units_seconds, self.Spawn, false);
}

self.alive = true;