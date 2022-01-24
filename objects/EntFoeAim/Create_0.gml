event_inherited();

self.Shoot = function() {
    var target = EntPlayer.id;
    var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
    var shot_velocity = self.shot_velocity;
    var shot_angle = point_direction(self.x, self.y, target.x, target.y) + random_range(-self.bullet_spread / 2, self.bullet_spread / 2);
    shot.xspeed =  shot_velocity * dcos(shot_angle);
    shot.yspeed = -shot_velocity * dsin(shot_angle);
    self.shot_cooldown = 1 / self.shots_per_second;
};