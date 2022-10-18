draw_surface_stretched(self.background_surface, 0, 0, window_get_width(), window_get_height());

shader_set(shd_cheap_scale);
var scale_x = (window_get_width() - 274) / (1366 - 274);
var scale_y = window_get_height() / 768;
shader_set_uniform_f(shader_get_uniform(shd_cheap_scale, "scale_amount"), scale_x, scale_y);
part_system_drawit(Particles.system);
shader_reset();

// draw the foreground outline
shader_set(shd_outline);
    shader_set_uniform_f(shader_get_uniform(shd_outline, "outlineColor"), 1, 1, 1);
shader_set_uniform_f(shader_get_uniform(shd_outline, "texSize"), surface_get_width(application_surface), surface_get_height(application_surface));
draw_surface_stretched(application_surface, 0, 0, window_get_width() - 274, window_get_height());
shader_reset();

// draw the filled part of the foreground
draw_surface_stretched(application_surface, 0, 0, window_get_width() - 274, window_get_height());