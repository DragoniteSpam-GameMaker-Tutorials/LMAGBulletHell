if (self.buff_fire.value) {
    self.buff_fire.damage_cooldown -= DT;
    if (self.buff_fire.damage_cooldown <= 0) {
        self.health--;
        self.CheckDeath();
        self.buff_fire.damage_cooldown = 1;
    }
}

self.buff_fire.duration -= DT;

if (self.buff_fire.duration <= 0) {
    self.buff_fire.value = false;
}