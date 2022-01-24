event_inherited();

self.health_max = 10;
self.health = self.health_max;
self.iframe_cooldown = 0;
self.iframe_duration = 1;

self.x = window_mouse_get_x();
self.y = window_mouse_get_y();

self.movement_speed = 720;
self.bullet_spread = 10;

self.shots_per_second = 10;
self.shot_cooldown = 0;
self.shot_cooldown_sub = 5;

self.buff_damage = {
    duration: 0,
    value: 0,
};

self.buff_fire_rate = {
    duration: 0,
    value: 1,
};

self.buff_damage_shield = {
    duration: 0,
    value: false,
};

self.buff_fire_bullets = {
    duration: 0,
    value: false,
};

self.buff_recursive = {
    duration: 0,
    value: false,
};

self.buff_explosive = {
    duration: 0,
    value: false,
};

self.CanShoot = function() {
    return (self.shot_cooldown <= 0);
};

self.Shoot = function() {
    var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
    var shot_velocity = DEFAULT_SHOT_VELOCITY;
    var shot_angle = 90 + random_range(-self.bullet_spread / 2, self.bullet_spread / 2);
    shot.xspeed =  shot_velocity * dcos(shot_angle);
    shot.yspeed = -shot_velocity * dsin(shot_angle);
    shot.friendly = true;
    shot.damage += self.buff_damage.value;
    if (self.buff_fire_bullets.value) shot.attribute_fire = true;
    if (self.buff_recursive.value) shot.attribute_recursive = true;
    if (self.buff_explosive.value) shot.attribute_explode = true;
    self.shot_cooldown = self.buff_fire_rate.value / self.shots_per_second;
};

self.CanShootSub = function() {
    return (self.shot_cooldown_sub <= 0);
};

self.ShootSub = function() {
    var shot = instance_create_depth(self.x, self.y, self.depth + 1, BulletFireBreath);
    var shot_velocity = DEFAULT_SHOT_VELOCITY;
    var shot_angle = 90;
    shot.xspeed =  shot_velocity * dcos(shot_angle);
    shot.yspeed = -shot_velocity * dsin(shot_angle);
    shot.friendly = true;
    shot.damage += self.buff_damage.value * SUB_ATTACK_BUFF_VALUE;
    shot.attribute_fire = true;
    self.shot_cooldown_sub = SUB_ATTACK_COOLDOWN;
};

self.Invincible = function() {
    return ((self.iframe_cooldown > 0) || self.buff_damage_shield.value);
};

self.OnDamage = function(bullet) {
    instance_destroy(bullet);
    
    if (self.Invincible()) return;
    
    self.health -= bullet.damage;
    self.CheckDeath();
    self.iframe_cooldown = self.iframe_duration;
};

self.OnEntityContact = function(bullet) {
    if (self.Invincible()) return;
    
    self.health--;
    self.CheckDeath();
    self.iframe_cooldown = self.iframe_duration;
};

self.CheckDeath = function() {
    if (self.health <= 0) {
        self.Die();
    }
};

self.Die = function() {
    show_debug_message("You died!");
    //instance_destroy();
};