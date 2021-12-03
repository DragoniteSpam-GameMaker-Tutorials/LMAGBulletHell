event_inherited();

self.shot_cooldown -= DT;

if (self.CanShoot()) {
    self.Shoot();
}