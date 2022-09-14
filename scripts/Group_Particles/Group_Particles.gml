#macro Particles            global.__particles__

Particles = new (function() constructor {
    self.system = part_system_create();
    
    part_system_automatic_update(self.system, false);
    part_system_automatic_draw(self.system, false);
    var _fps = game_get_speed(gamespeed_fps);
})();