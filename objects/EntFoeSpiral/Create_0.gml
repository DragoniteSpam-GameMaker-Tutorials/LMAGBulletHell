event_inherited();

self.last_shot_angle = 270;

self.Shoot = function() {
    var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
    var shot_velocity = self.shot_velocity;
    shot.xspeed =  shot_velocity * dcos(self.last_shot_angle);
    shot.yspeed = -shot_velocity * dsin(self.last_shot_angle);
    self.shot_cooldown = 1 / self.shots_per_second;
    self.last_shot_angle += 10;
    self.last_shot_angle %= 360;
};