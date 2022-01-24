event_inherited();

if (!self.active) return;

self.shot_cooldown -= DT;

if (self.CanShoot()) {
    self.Shoot();
}