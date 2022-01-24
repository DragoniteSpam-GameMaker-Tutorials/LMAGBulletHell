self.attribute_fire = false;
self.attribute_recursive = false;
self.attribute_explode = false;

self.ApplyEffect = function(entity) {
    if (self.attribute_fire) {
        entity.buff_fire.value = true;
        entity.buff_fire.duration = DEFAULT_EFFECT_DURATION;
        entity.buff_fire.damage_cooldown = 1;
    }
    if (self.attribute_recursive) {
        var number_of_shots = 8;
        for (var i = 0; i < 360; i += 360 / number_of_shots) {
            var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
            var shot_velocity = DEFAULT_SHOT_VELOCITY;
            var shot_angle = i;
            shot.xspeed =  shot_velocity * dcos(shot_angle);
            shot.yspeed = -shot_velocity * dsin(shot_angle);
            shot.attribute_recursive = false;
            shot.attribute_fire = self.attribute_fire;
            shot.attribute_explode = self.attribute_explode;
            shot.friendly = self.friendly;
            shot.ignore = entity.id;
        }
    }
    if (self.attribute_explode) {
        var shot = instance_create_depth(self.x, self.y, self.depth + 1, BulletExplosionFragments);
        shot.friendly = self.friendly;
        shot.attribute_fire = self.attribute_fire;
        shot.attribute_recursive = false;
        shot.attribute_explode = false;
    }
};