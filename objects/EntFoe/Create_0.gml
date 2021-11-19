event_inherited();

self.health = 4;

self.OnDamage = function(bullet) {
    self.health -= bullet.damage;
    instance_destroy(bullet);
    if (self.health <= 0) {
        instance_destroy();
    }
};