event_inherited();

self.bullet_spread = 0;
self.score = 25;

self.Shoot = function() {
    var number_of_shots = 8;
    for (var i = 0; i < 360; i += 360 / number_of_shots) {
        var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
        var shot_velocity = self.shot_velocity;
        var shot_angle = i;
        shot.xspeed =  shot_velocity * dcos(shot_angle);
        shot.yspeed = -shot_velocity * dsin(shot_angle);
    }
    self.shot_cooldown = 1 / self.shots_per_second;
};