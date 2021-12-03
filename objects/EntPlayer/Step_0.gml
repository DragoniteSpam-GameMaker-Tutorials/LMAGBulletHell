event_inherited();

var distance_to_target = point_distance(self.x, self.y, mouse_x, mouse_y);
var direction_to_target = point_direction(self.x, self.y, mouse_x, mouse_y);
var distance_to_move = min(self.movement_speed, distance_to_target);
self.x += distance_to_move * dcos(direction_to_target);
self.y -= distance_to_move * dsin(direction_to_target);

self.shot_cooldown -= DT;
self.iframe_cooldown -= DT;

if (mouse_check_button(mb_left)) {
    if (self.CanShoot()) {
        self.Shoot();
    }
}

if (self.Invincible()) {
    self.sprite_index = spr_player_iframes;
} else {
    self.sprite_index = spr_player;
}

self.buff_damage.duration -= DT;
self.buff_fire_rate.duration -= DT;
self.buff_damage_shield.duration -= DT;
self.buff_fire_bullets.duration -= DT;
self.buff_recursive.duration -= DT;
self.buff_explosive.duration -= DT;

if (self.buff_damage.duration <= 0) {
    self.buff_damage.value = 0;
}

if (self.buff_fire_rate.duration <= 0) {
    self.buff_fire_rate.value = 1;
}

if (self.buff_damage_shield.duration <= 0) {
    self.buff_damage_shield.value = false;
}

if (self.buff_fire_bullets.duration <= 0) {
    self.buff_fire_bullets.value = false;
}

if (self.buff_recursive.duration <= 0) {
    self.buff_recursive.value = false;
}

if (self.buff_explosive.duration <= 0) {
    self.buff_explosive.value = false;
}