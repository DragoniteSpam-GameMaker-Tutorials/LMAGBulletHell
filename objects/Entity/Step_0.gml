if (!is_playing()) exit;

if (!self.immune_to_fire && self.buff_fire.value) {
    self.buff_fire.damage_cooldown -= DT;
    if (self.buff_fire.damage_cooldown <= 0) {
        self.health -= self.buff_fire.amount;
        self.CheckDeath();
        self.buff_fire.damage_cooldown = 1;
    }
    part_particles_create(Particles.system, self.x, self.y, Particles.type_on_fire, 2);
}

self.buff_fire.duration -= DT;

if (self.buff_fire.duration <= 0) {
    self.buff_fire.value = false;
}

self.frame_index += self.animation_speed * DT;
self.frame_index %= array_length(self.frames);

if (self.hitflash_time > 0) {
    self.hitflash_time -= DT;
    self.hitflash_scale = lerp(self.hitflash_scale, 1, HITFLASH_REDUCTION_AMOUNT * DT);
} else {
    self.hitflash_scale = 1;
}