function Level() constructor {
    self.wave_index = 0;
    self.waves = [];
    for (var index = 1; layer_exists("Wave" + string(index)); index++) {
        var layer_data = layer_get_id("Wave" + string(index));
        array_push(self.waves, layer_data);
        instance_deactivate_layer(layer_data);
    }
    
    static SendNextWave = function() {
        instance_activate_layer(self.waves[self.wave_index]);
        self.wave_index++;
    };
    
    static Complete = function() {
        return (self.wave_index == array_length(self.waves));
    };
}