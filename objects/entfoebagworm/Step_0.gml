event_inherited();

if (!is_playing()) return;

if (!self.active) return;

self.time_to_live -= DT;
if (self.time_to_live <= 0) {
    self.Die();
}