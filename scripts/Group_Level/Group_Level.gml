#macro WAVE_DURATION                            60
#macro SCORE_MULTIPLIER_REDUCTION               (self.score_multiplier - DT / 4)
#macro SCORE_MULTIPLIER_INCREASE                0.05
#macro SCORE_MULTIPLIER_TIMER_DURATION          2
#macro LEVEL_SCROLL_SPEED                       150
#macro LEVEL_BACKGROUND_OBJECTS                 400

function Level(level_type, level_color) constructor {
    self.score = 0;
    self.score_multiplier = 1;
    self.score_multiplier_timer = 0;
    self.stomp_count = 0;
    self.shots = 0;
    self.damage_taken = 0;
    self.damage_dealt = 0;
    
    self.highest_score_multiplier = 1;
    
    self.game_timer = 0;
    
    self.wave_index = 0;
    self.waves = [];
    self.wave_timer = WAVE_DURATION;
    
    self.level_type = level_type;
    self.level_color = level_color;
    self.level_objects = array_create(LEVEL_BACKGROUND_OBJECTS);
    
    for (var i = 0; i < LEVEL_BACKGROUND_OBJECTS; i++) {
        self.level_objects[i] = {
            x: random(room_width),
            y: random_range(-64, room_height + 64),
            mesh: array_get_random_element(level_type),
            scale: random_range(1.8, 2.2)
        };
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
        
        if (EntPlayer.alive && (instance_number(EntFoe) == 0 || self.wave_timer <= 0) && GameController.end_of_level_screen == "") {
            if (self.Complete()) {
                if (instance_number(EntFoe) == 0) {
                    GameController.ShowWinScreen();
                } // else there are still foes and you're being slow
            } else {
                self.SendNextWave();
            }
        }
        
        for (var i = array_length(self.level_objects) - 1; i >= 0; i--) {
            var object = self.level_objects[i];
            object.y += LEVEL_SCROLL_SPEED * DT;
            
            if (object.y > room_height + 128) {
                object.x = random(room_width);
                object.y -= room_height + 192;
                object.mesh = array_get_random_element(self.level_type);
            }
        }
    };
    
    static AddScore = function(value) {
        self.score += floor(value * self.score_multiplier);
        self.score_multiplier += SCORE_MULTIPLIER_INCREASE;
        self.score_multiplier_timer = SCORE_MULTIPLIER_TIMER_DURATION;
        self.stomp_count++;
        
        self.highest_score_multiplier = max(self.score_multiplier, self.highest_score_multiplier);
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