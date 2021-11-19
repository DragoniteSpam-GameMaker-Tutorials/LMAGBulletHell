event_inherited();

self.health = 4;

self.bullet_spread = 10;
self.shots_per_second = 1;
self.last_shot_time = 0;
self.shot_velocity = 4;

self.OnDamage = function(bullet) {
    self.health -= bullet.damage;
    instance_destroy(bullet);
    if (self.health <= 0) {
        instance_destroy();
    }
};