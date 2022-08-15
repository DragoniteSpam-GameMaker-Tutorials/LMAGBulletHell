//event_inherited();

if (!is_playing()) return;

if (!self.active) return;

var mspd = point_distance(0, 0, self.xspeed, self.yspeed);
var dir = point_direction(0, 0, self.xspeed, self.yspeed);
var dir_to_player = point_direction(self.x, self.y, EntPlayer.x, EntPlayer.y);
var diff = angle_difference(dir, dir_to_player);

dir -= self.homing_amount * DT * sign(diff);

self.xspeed =  mspd * dcos(dir);
self.yspeed = -mspd * dsin(dir);

self.x += DT * self.xspeed;
self.y += DT * self.yspeed;

self.frame_index += self.animation_speed * DT;
self.frame_index %= array_length(self.frames);

self.image_angle = dir;