var scale = 2 * self.hitflash_scale;
matrix_set(matrix_world, matrix_build(self.x, self.y, -self.depth, 0, 0, self.image_angle, scale, scale, -scale));
vertex_submit(self.frames[self.frame_index], pr_trianglelist, -1);
matrix_set(matrix_world, matrix_build_identity());