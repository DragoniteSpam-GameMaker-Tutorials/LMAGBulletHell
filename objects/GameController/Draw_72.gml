/// @description Level background stuff

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
shader_set(shd_world);

var fore_width = Settings.video.size_value.x - 274;
var fore_height = Settings.video.size_value.y;

var back_width = Settings.video.scale_value * Settings.video.size_value.x - 274;
var back_height = Settings.video.scale_value * Settings.video.size_value.y;

self.background_surface = surface_validate(self.background_surface, back_width, back_height);

if (surface_get_width(application_surface) != fore_width || surface_get_height(application_surface) != fore_height) {
    surface_resize(application_surface, fore_width, fore_height);
}

var default_camera = camera_get_active();

surface_set_target(self.background_surface);
camera_apply(self.background_camera);

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

surface_reset_target();
camera_apply(default_camera);
draw_clear_alpha(c_black, 0);

shader_reset();
gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);

with (Bullet) event_perform(ev_draw, 0);

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
shader_set(shd_world);