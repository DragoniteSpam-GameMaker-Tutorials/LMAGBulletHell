/// @description Level background stuff

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
shader_set(shd_world);

if (self.state != GameStates.TITLE) {
    draw_clear(self.level.level_data.color);
    for (var i = 0, n = array_length(self.level.level_objects); i < n; i++) {
        var object = self.level.level_objects[i];
        
        var matrix = matrix_build(object.x, object.y, 0, -15, 0, 0, object.scale, object.scale, -object.scale);
        matrix_set(matrix_world, matrix);
        vertex_submit(object.mesh, pr_trianglelist, -1);
        matrix_set(matrix_world, matrix_build_identity());
    }
}

shader_reset();
gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);