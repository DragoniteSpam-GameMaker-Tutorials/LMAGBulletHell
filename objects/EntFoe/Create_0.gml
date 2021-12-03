event_inherited();

self.health_max = 4;
self.health = self.health_max;

self.bullet_spread = 10;
self.shots_per_second = 1;
self.shot_cooldown = 0;
self.shot_velocity = 4;

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
    instance_create_depth(self.x, self.y, self.depth + 1, PickupFasterFire);
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