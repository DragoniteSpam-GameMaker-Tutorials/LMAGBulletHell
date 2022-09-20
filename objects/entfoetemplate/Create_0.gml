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

self.UpdateHPStage = function() {
};

self.OnDamage = function(bullet) {
    if (bullet.objects_hit[$ string(self.id)]) return;
    bullet.objects_hit[$ string(self.id)] = true;
    
    if (self.damage_shield > 0) {
        self.damage_shield--;
        // do something so that you know there was a shield
    } else {
        self.health -= max(0, bullet.damage - self.defense);
        GameController.level.stats.damage_dealt += bullet.damage;
        if (bullet.destroy_on_hit) instance_destroy(bullet);
        self.UpdateHPStage();
        self.CheckDeath();
    }
    
    part_particles_create(Particles.system, self.x, self.y, Particles.type_foe_hit, 5);
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
    if (!EntPlayer.alive && !EntPlayer.officially_dead) {
        EntPlayer.alive = true;
        EntPlayer.health = 1;
    }
    instance_destroy();
    //part_particles_create(Particles.system, self.x, self.y, Particles.type_foe_die, 10);
};

self.Shoot = function() {
    repeat (self.round_size) {
        var shot = instance_create_depth(self.x, self.y, self.depth + 1, self.default_bullet_type);
        var shot_velocity = self.shot_velocity;
        var shot_angle = 270 + random_range(-self.bullet_spread / 2, self.bullet_spread / 2);
        shot.xspeed =  shot_velocity * dcos(shot_angle);
        shot.yspeed = -shot_velocity * dsin(shot_angle);
        
        self.shot_enabled = false;
        self.SetTimer(1 / self.shots_per_second, function() {
            self.shot_enabled = true;
        });
    }
};

path_start(self.path_enter, 10, path_action_stop, false);