#macro WAVE_DURATION                            60
#macro SCORE_MULTIPLIER_REDUCTION               (self.stats.score_multiplier - DT / 4)
#macro SCORE_MULTIPLIER_INCREASE                0.05
#macro SCORE_MULTIPLIER_TIMER_DURATION          2
#macro LEVEL_SCROLL_SPEED                       150
#macro LEVEL_BACKGROUND_OBJECTS                 400

function Level(level_data) constructor {
    self.stats = {
        score: 0,
        score_multiplier: 1,
        score_multiplier_timer: 0,
        stomp_count: 0,
        shots: 0,
        damage_taken: 0,
        damage_dealt: 0,
        highest_score_multiplier: 1,
    };
    
    self.game_timer = 0;
    
    self.wave_index = 0;
    self.waves = [];
    self.wave_timer = WAVE_DURATION;
    
    self.level_data = level_data;
    self.level_objects = array_create(LEVEL_BACKGROUND_OBJECTS);
    
    for (var i = 0; i < LEVEL_BACKGROUND_OBJECTS; i++) {
        self.level_objects[i] = {
            x: random(room_width),
            y: random_range(-64, room_height + 64),
            mesh: array_get_random_element(level_data.meshes),
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
        
        self.stats.score_multiplier_timer -= DT;
        self.wave_timer -= DT;
        self.game_timer += DT;
        
        if (self.stats.score_multiplier_timer <= 0) {
            self.stats.score_multiplier = max(1, SCORE_MULTIPLIER_REDUCTION);
        }
        
        var objects_to_spawn = 0;
        
        with (Spawner) {
            objects_to_spawn += self.spawn_count;
        }
        
        if (EntPlayer.alive && (foe_count() == 0 || self.wave_timer <= 0) && GameController.end_of_level_screen == "" && objects_to_spawn == 0) {
            if (self.Complete()) {
                if (foe_count() == 0) {
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
                object.mesh = array_get_random_element(self.level_data.meshes);
            }
        }
    };
    
    static AddScore = function(value) {
        self.stats.score += floor(value * self.stats.score_multiplier);
        self.stats.score_multiplier += SCORE_MULTIPLIER_INCREASE;
        self.stats.score_multiplier_timer = SCORE_MULTIPLIER_TIMER_DURATION;
        self.stats.stomp_count++;
        
        self.stats.highest_score_multiplier = max(self.stats.score_multiplier, self.stats.highest_score_multiplier);
    };
    
    static SendNextWave = function() {
        instance_activate_layer(self.waves[self.wave_index]);
        with (Spawner) self.Spawn();
        self.wave_index++;
        self.wave_timer = WAVE_DURATION;
    };
    
    static Complete = function() {
        return (self.wave_index == array_length(self.waves));
    };
}

function LevelMetadata(name, id, mesh_array, background_color) constructor {
    self.name = name;
    self.id = id;
    self.meshes = mesh_array;
    self.color = background_color;
}