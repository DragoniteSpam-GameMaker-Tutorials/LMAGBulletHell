gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
shader_set(shd_world);
for (var i = 0; i < 10; i++) {
    var matrix = matrix_build(64 + 128 * i, 128, 0, 0, 0, 0, 2, 2, -2);
    matrix_set(matrix_world, matrix);
    var mesh = self.meshes.woodlands[$ variable_struct_get_names(self.meshes.woodlands)[i]];
    vertex_submit(mesh, pr_trianglelist, -1);
    matrix_set(matrix_world, matrix_build_identity());
}
shader_reset();
gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);