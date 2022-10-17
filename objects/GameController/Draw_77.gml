draw_surface_stretched(self.background_surface, 0, 0, window_get_width(), window_get_height());
part_system_drawit(Particles.system);

// draw the foreground outline
shader_set(shd_outline);
shader_set_uniform_f(shader_get_uniform(shd_outline, "texSize"), surface_get_width(application_surface), surface_get_height(application_surface));
draw_surface(application_surface, 0, 0);
shader_reset();

// draw the filled part of the foreground
draw_surface(application_surface, 0, 0);