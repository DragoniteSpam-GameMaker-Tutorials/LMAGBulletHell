//event_inherited();

if (!is_playing()) return;

if (!self.active) return;

var mspd = point_distance(0, 0, self.xspeed, self.yspeed);
var buffer_size = 128;
var speed_modifier = 1;

if (point_in_rectangle(self.x, self.y, -buffer_size, -buffer_size, room_width + buffer_size, room_height + buffer_size)) {
    self.has_been_on_screen = true;
} else {
    if (self.has_been_on_screen) speed_modifier = 4;
}

var dir = point_direction(0, 0, self.xspeed, self.yspeed);
var dir_to_player = point_direction(self.x, self.y, EntPlayer.x, EntPlayer.y);
var diff = angle_difference(dir, dir_to_player);

dir -= self.homing_amount * speed_modifier * DT * clamp(diff, -1, 1);

self.xspeed =  mspd * dcos(dir);
self.yspeed = -mspd * dsin(dir);

self.x += DT * self.xspeed * speed_modifier;
self.y += DT * self.yspeed * speed_modifier;

self.frame_index += self.animation_speed * DT;
self.frame_index %= array_length(self.frames);

self.image_angle = dir + 90;

var current = self.id;
var next = current.next;

while (next != undefined) {
    dir = point_direction(current.x, current.y, next.x, next.y);
    
    next.x = current.x + self.spacing * dcos(dir);
    next.y = current.y - self.spacing * dsin(dir);
    next.image_angle = dir + 90;
    
    current = next;
    next = next.next;
}