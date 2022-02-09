if (!self.alive) return;

draw_self();
if (self.buff_damage_shield.value) {
    draw_sprite_ext(spr_damage_shield, 0 , self.x, self.y, 1, 1, 0, c_white, min(self.buff_damage_shield.duration, 1));
}