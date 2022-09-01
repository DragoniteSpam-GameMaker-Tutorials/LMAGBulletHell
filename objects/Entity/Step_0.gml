if (!is_playing()) exit;

if (!self.immune_to_fire && self.buff_fire.value) {
    self.buff_fire.damage_cooldown -= DT;
    if (self.buff_fire.damage_cooldown <= 0) {
        self.health -= self.buff_fire.amount;
        self.CheckDeath();
        self.buff_fire.damage_cooldown = 1;
    }
}

self.buff_fire.duration -= DT;

if (self.buff_fire.duration <= 0) {
    self.buff_fire.value = false;
}

self.frame_index += self.animation_speed * DT;
self.frame_index %= array_length(self.frames);