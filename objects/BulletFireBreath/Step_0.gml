event_inherited();

if (!is_playing()) return;

part_particles_create(Particles.system, self.x, self.y, Particles.type_fire_breath, 5);