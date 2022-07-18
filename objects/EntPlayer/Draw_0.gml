if (!self.alive) return;

var scale = 2;
matrix_set(matrix_world, matrix_build(self.x, self.y, -self.depth, 0, 0, 0, scale, scale, -scale));
vertex_submit(self.frames[self.frame_index], pr_trianglelist, -1);
matrix_set(matrix_world, matrix_build_identity());

if (self.buff_damage_shield.value) {
    draw_sprite_ext(spr_damage_shield, 0 , self.x, self.y, 1, 1, 0, c_white, min(self.buff_damage_shield.duration, 1));
}