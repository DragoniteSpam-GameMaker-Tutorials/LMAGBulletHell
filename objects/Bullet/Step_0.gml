if (!is_playing()) return;

self.x += self.xspeed;
self.y += self.yspeed;

if (self.x > room_width + sprite_width / 2 ||
    self.x <             -sprite_width / 2 ||
    self.y > room_height + sprite_height / 2 ||
    self.y <             -sprite_height / 2) {
    instance_destroy();
}