#macro WAVE_DURATION 60

function Level() constructor {
    self.wave_index = 0;
    self.waves = [];
    self.wave_timer = WAVE_DURATION;
    
    for (var index = 1; layer_exists("Wave" + string(index)); index++) {
        var layer_data = layer_get_id("Wave" + string(index));
        array_push(self.waves, layer_data);
        instance_deactivate_layer(layer_data);
    }
    
    static Update = function() {
        self.wave_timer -= DT;
        
        if (instance_number(EntFoe) == 0 || self.wave_timer <= 0) {
            if (self.Complete()) {
                if (instance_number(EntFoe) == 0) {
                    // you win!
                } // else there are still foes and you're being slow
            } else {
                self.SendNextWave();
            }
        }
    };
    
    static SendNextWave = function() {
        instance_activate_layer(self.waves[self.wave_index]);
        self.wave_index++;
        self.wave_timer = WAVE_DURATION;
    };
    
    static Complete = function() {
        return (self.wave_index == array_length(self.waves));
    };
}