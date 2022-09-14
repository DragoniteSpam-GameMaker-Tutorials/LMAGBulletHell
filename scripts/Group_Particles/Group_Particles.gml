#macro Particles            global.__particles__

Particles = new (function() constructor {
    self.system = part_system_create();
    
    part_system_automatic_update(self.system, false);
    part_system_automatic_draw(self.system, false);
    var _fps = game_get_speed(gamespeed_fps);
    
    self.type_foe_hit = part_type_create();
    part_type_speed(self.type_foe_hit, 1, 1.50, -0.01, 0);
    part_type_direction(self.type_foe_hit, 10, 170, 0, 0);
    part_type_gravity(self.type_foe_hit, 0, 270);
    part_type_orientation(self.type_foe_hit, 0, 0, 0, 0, 0);
    part_type_size(self.type_foe_hit, 1, 1, 0, 0);
    part_type_scale(self.type_foe_hit, 0.3, 0.5);
    part_type_life(self.type_foe_hit, 1 * _fps, 1.5 * _fps);
    part_type_blend(self.type_foe_hit, false);
    part_type_color3(self.type_foe_hit, c_white, c_ltgray, c_white);
    part_type_alpha3(self.type_foe_hit, 0.52, 0.1, 0);
    part_type_shape(self.type_foe_hit, pt_shape_sphere);
})();