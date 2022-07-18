event_inherited();

if (!is_playing()) return;

if (!self.active) return;

var target = EntPlayer.id;

var distance_to_target = point_distance(self.x, self.y, target.x, target.y);
var direction_to_target = point_direction(self.x, self.y, target.x, target.y);
var distance_to_move = min(self.movement_speed * DT, distance_to_target);
self.x += distance_to_move * dcos(direction_to_target);
self.y -= distance_to_move * dsin(direction_to_target);

// because the base models are facing forward (direction 270)
self.face_direction = direction_to_target + 90;