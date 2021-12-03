event_inherited();

self.friendly = true;

self.health = 10;
self.iframe_time = 0;
self.iframe_duration = 1;

self.x = mouse_x;
self.y = mouse_y;

self.movement_speed = 12;
self.bullet_spread = 10;

self.shots_per_second = 10;
self.last_shot_time = 0;

self.CanShoot = function() {
    return (self.last_shot_time + 1 / self.shots_per_second) <= (current_time / 1000);
};

self.Shoot = function() {
    var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
    var shot_velocity = 10;
    var shot_angle = 90 + random_range(-self.bullet_spread / 2, self.bullet_spread / 2);
    shot.xspeed =  shot_velocity * dcos(shot_angle);
    shot.yspeed = -shot_velocity * dsin(shot_angle);
    shot.friendly = true;
    self.last_shot_time = current_time / 1000;
};

self.Invincible = function() {
    return (self.iframe_time + self.iframe_duration) > (current_time / 1000);
};

self.OnDamage = function(bullet) {
    instance_destroy(bullet);
    
    if (self.Invincible()) return;
    
    self.health -= bullet.damage;
    if (self.health <= 0) {
        self.Die();
    }
    self.iframe_time = current_time / 1000;
};

self.OnEntityContact = function(bullet) {
    if (self.Invincible()) return;
    
    self.health--;
    if (self.health <= 0) {
        self.Die();
    }
    self.iframe_time = current_time / 1000;
};

self.Die = function() {
    show_debug_message("You died!");
    //instance_destroy();
};