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
    
    self.type_on_fire = part_type_create();
    part_type_speed(self.type_on_fire, 1, 1.50, -0.01, 0);
    part_type_direction(self.type_on_fire, 45, 135, 0, 0);
    part_type_gravity(self.type_on_fire, 0, 270);
    part_type_orientation(self.type_on_fire, 0, 0, 0, 0, 0);
    part_type_size(self.type_on_fire, 1, 1, 0, 0);
    part_type_scale(self.type_on_fire, 0.3, 0.5);
    part_type_life(self.type_on_fire, 1 * _fps, 1.5 * _fps);
    part_type_blend(self.type_on_fire, true);
    part_type_color2(self.type_on_fire, 8388607, 255);
    part_type_alpha2(self.type_on_fire, 0.2, 0);
    part_type_shape(self.type_on_fire, pt_shape_sphere);
    
    self.type_player_hit = part_type_create();
    part_type_speed(self.type_player_hit, 2, 2.50, 0, 0);
    part_type_direction(self.type_player_hit, 0, 360, 0, 0);
    part_type_gravity(self.type_player_hit, 0, 270);
    part_type_orientation(self.type_player_hit, 0, 0, 0, 0, 0);
    part_type_size(self.type_player_hit, 1, 1, 0, 0);
    part_type_scale(self.type_player_hit, 0.50, 0.50);
    part_type_life(self.type_player_hit, 0.25 * _fps, 0.50 * _fps);
    part_type_blend(self.type_player_hit, false);
    part_type_color2(self.type_player_hit, 255, 255);
    part_type_alpha2(self.type_player_hit, 0.56, 0);
    part_type_shape(self.type_player_hit, pt_shape_sphere);
    
    self.type_boss_stage = part_type_create();
    part_type_speed(self.type_boss_stage, 2, 2.50, -0.02, 0);
    part_type_direction(self.type_boss_stage, 0, 360, 0, 0);
    part_type_gravity(self.type_boss_stage, 0, 270);
    part_type_orientation(self.type_boss_stage, 0, 0, 0, 0, 0);
    part_type_size(self.type_boss_stage, 1, 1, 0, 0);
    part_type_scale(self.type_boss_stage, 1, 1);
    part_type_life(self.type_boss_stage, 1 * _fps, 1.50 * _fps);
    part_type_blend(self.type_boss_stage, false);
    part_type_color2(self.type_boss_stage, 16777215, 16777215);
    part_type_alpha2(self.type_boss_stage, 1, 0);
    part_type_shape(self.type_boss_stage, pt_shape_sphere);
    
    self.type_explosion = part_type_create();
    part_type_speed(self.type_explosion, 2, 4, 0, 0);
    part_type_direction(self.type_explosion, 0, 360, 0, 0);
    part_type_gravity(self.type_explosion, 0, 270);
    part_type_orientation(self.type_explosion, 0, 360, 0, 0, 0);
    part_type_size(self.type_explosion, 1, 1, 0, 0);
    part_type_scale(self.type_explosion, 1.50, 1.50);
    part_type_life(self.type_explosion, 0.50 * _fps, 1 * _fps);
    part_type_blend(self.type_explosion, false);
    part_type_color3(self.type_explosion, 6710886, 394758, 0);
    part_type_alpha3(self.type_explosion, 0.11, 0.64, 0);
    part_type_shape(self.type_explosion, pt_shape_explosion);
})();