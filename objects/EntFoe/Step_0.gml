event_inherited();

if (!is_playing()) return;

if (!self.active) return;

if (self.CanShoot()) {
    self.Shoot();
}