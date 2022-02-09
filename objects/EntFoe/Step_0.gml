event_inherited();

if (!is_playing()) return;

if (!self.active) return;

self.shot_cooldown -= DT;

if (self.CanShoot()) {
    self.Shoot();
}