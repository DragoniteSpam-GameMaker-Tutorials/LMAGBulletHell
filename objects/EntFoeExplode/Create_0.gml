event_inherited();

self.shot_cooldown = 10;

self.Shoot = function() {
    self.Die();
};

self.Die = function() {
    var number_of_shots = 12;
    repeat (number_of_shots) {
        var shot = instance_create_depth(self.x, self.y, self.depth + 1, Bullet);
        var shot_velocity = self.shot_velocity;
        var shot_angle = random(360);
        shot.xspeed =  shot_velocity * dcos(shot_angle);
        shot.yspeed = -shot_velocity * dsin(shot_angle);
    }
    instance_destroy();
};