if (!is_playing()) return;

event_inherited();

var mspd = point_distance(0, 0, self.xspeed, self.yspeed);
var dir = point_direction(0, 0, self.xspeed, self.yspeed);
var dir_to_player = point_direction(self.x, self.y, EntPlayer.x, EntPlayer.y);
var diff = angle_difference(dir, dir_to_player);

dir -= self.homing_amount * DT * sign(diff);

self.xspeed =  mspd * dcos(dir);
self.yspeed = -mspd * dsin(dir);