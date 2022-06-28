#macro WAVE_DURATION                            60
#macro SCORE_MULTIPLIER_REDUCTION               (self.score_multiplier - DT / 4)
#macro SCORE_MULTIPLIER_INCREASE                0.05
#macro SCORE_MULTIPLIER_TIMER_DURATION          2

function Level() constructor {
    self.score = 0;
    self.score_multiplier = 1;
    self.score_multiplier_timer = 0;
    self.stomp_count = 0;
    
    self.game_timer = 0;
    
    self.wave_index = 0;
    self.waves = [];
    self.wave_timer = WAVE_DURATION;
    
    self.level_objects = [];
    
    repeat (100) {
        array_push(self.level_objects, {
            x: random(room_width),
            y: random(room_height),
            mesh: array_get_random_element(GameController.meshes.woodlands),
        });
    }
    
    for (var index = 1; layer_exists("Wave" + string(index)); index++) {
        var layer_data = layer_get_id("Wave" + string(index));
        array_push(self.waves, layer_data);
        instance_deactivate_layer(layer_data);
    }
    
    static Update = function() {
        if (!is_playing()) return;
        
        self.wave_timer -= DT;
        self.score_multiplier_timer -= DT;
        self.game_timer += DT;
        
        if (self.score_multiplier_timer <= 0) {
            self.score_multiplier = max(1, SCORE_MULTIPLIER_REDUCTION);
        }
        
        if (EntPlayer.alive && (instance_number(EntFoe) == 0 || self.wave_timer <= 0)) {
            if (self.Complete()) {
                if (instance_number(EntFoe) == 0) {
                    GameController.ShowWinScreen();
                } // else there are still foes and you're being slow
            } else {
                self.SendNextWave();
            }
        }
    };
    
    static AddScore = function(value) {
        self.score += value * self.score_multiplier;
        self.score_multiplier += SCORE_MULTIPLIER_INCREASE;
        self.score_multiplier_timer = SCORE_MULTIPLIER_TIMER_DURATION;
        self.stomp_count++;
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