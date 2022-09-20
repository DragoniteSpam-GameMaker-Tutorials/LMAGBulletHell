event_inherited();

if (!is_playing()) {
    self.path_speed = 0;
    return;
}

self.path_speed = self.default_path_speed;

if (!self.active) return;

if (self.CanShoot()) {
    self.Shoot();
}