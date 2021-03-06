event_inherited();

self.health = self.health_max;
self.active = false;
self.shot_enabled = true;

self.drops = [
    new PickupDropOdds(PickupHealth, 5),
    new PickupDropOdds(PickupFasterFire, 5),
    new PickupDropOdds(PickupMoreDamage, 5),
    new PickupDropOdds(PickupDamageShield, 5),
    new PickupDropOdds(PickupRecursiveBullet, 5),
    new PickupDropOdds(PickupFireBullet, 5),
    new PickupDropOdds(PickupExplosiveBullet, 5),
];

self.OnDamage = function(bullet) {
    self.health -= bullet.damage;
    GameController.level.stats.damage_dealt += bullet.damage;
    instance_destroy(bullet);
    self.CheckDeath();
};

self.CanShoot = function() {
    return self.shot_enabled;
};

self.CheckDeath = function() {
    if (self.health <= 0) {
        self.Die();
    }
};

self.Die = function() {
    var odds = random(100);
    for (var i = 0, n = array_length(self.drops); i < n; i++) {
        if (odds < self.drops[i].odds) {
            instance_create_depth(self.x, self.y, self.depth + 1, self.drops[i].type);
            break;
        }
        odds -= self.drops[i].odds;
    }
    GameController.level.AddScore(self.point_value);
    instance_destroy();
};

self.Shoot = function() {
    var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
    var shot_velocity = self.shot_velocity;
    var shot_angle = 270 + random_range(-self.bullet_spread / 2, self.bullet_spread / 2);
    shot.xspeed =  shot_velocity * dcos(shot_angle);
    shot.yspeed = -shot_velocity * dsin(shot_angle);
    
    self.shot_enabled = false;
    self.SetTimer(1 / self.shots_per_second, function() {
        self.shot_enabled = true;
    });
};

path_start(self.path_enter, 10, path_action_stop, false);