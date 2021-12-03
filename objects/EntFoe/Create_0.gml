event_inherited();

self.health_max = 4;
self.health = self.health_max;

self.bullet_spread = 10;
self.shots_per_second = 1;
self.shot_cooldown = 0;
self.shot_velocity = 4;

self.drops = [
    new PickupDropOdds(PickupHealth, 5),
    new PickupDropOdds(PickupFasterFire, 5),
    new PickupDropOdds(PickupMoreDamage, 5),
    new PickupDropOdds(PickupDamageShield, 5),
    new PickupDropOdds(PickupRecursive, 5),
];

self.OnDamage = function(bullet) {
    self.health -= bullet.damage;
    instance_destroy(bullet);
    if (self.health <= 0) {
        self.Die();
    }
};

self.CanShoot = function() {
    return (self.shot_cooldown <= 0);
};

self.Die = function() {
    for (var i = 0, n = array_length(self.drops); i < n; i++) {
        var odds = random(100);
        if (odds < self.drops[i].odds) {
            instance_create_depth(self.x, self.y, self.depth + 1, self.drops[i].type);
        }
    }
    instance_destroy();
};

self.Shoot = function() {
    var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
    var shot_velocity = self.shot_velocity;
    var shot_angle = 270 + random_range(-self.bullet_spread / 2, self.bullet_spread / 2);
    shot.xspeed =  shot_velocity * dcos(shot_angle);
    shot.yspeed = -shot_velocity * dsin(shot_angle);
    self.shot_cooldown = 1 / self.shots_per_second;
};