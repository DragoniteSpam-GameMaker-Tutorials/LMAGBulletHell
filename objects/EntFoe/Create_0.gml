event_inherited();

self.health = 4;

self.bullet_spread = 10;
self.shots_per_second = 10;
self.last_shot_time = 0;

self.OnDamage = function(bullet) {
    self.health -= bullet.damage;
    instance_destroy(bullet);
    if (self.health <= 0) {
        instance_destroy();
    }
};