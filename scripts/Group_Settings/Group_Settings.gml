#macro Settings global.__settings

Settings = {
    audio: {
        master: 1,
        bgm: 1,
        se: 1,
        
        ApplyVolume: function() {
            audio_set_master_gain(0, self.master);
			if (global.bgm_currently_playing != -1) {
				audio_sound_gain(global.bgm_currently_playing, self.bgm, 0);
			}
        },
    },
    
    video: {
        default_frame_rates: [
            30, 60, 120, 144,
        ],
        frame_rate_index: 1,
        frame_rate_value: 60,
        
        ApplyFPS: function() {
            self.frame_rate_value = self.default_frame_rates[self.frame_rate_index];
            game_set_speed(self.frame_rate_value, gamespeed_fps);
        },
        
        default_scales: [
            0.25, 0.33, 0.40, 0.50, 0.75, 1.00
        ],
        scale_index: 5,
        scale_value: 1,
        
        ApplyScale: function() {
            self.scale_value = self.default_scales[self.scale_index];
        },
        
        default_screen_sizes: [
            { x: 1366, y: 768 },
            { x: 1600, y: 900 },
            { x: 1920, y: 1080 },
            { x: 2560, y: 1440 },
        ],
        size_index: 0,
        size_value: { x: 1366, y: 768 },
        
        ApplyScreenSize: function() {
            self.size_value.x = self.default_screen_sizes[self.size_index].x;
            self.size_value.y = self.default_screen_sizes[self.size_index].y;
            window_set_size(self.size_value.x, self.size_value.y);
        },
    },
    
    languages: [
        "English", "English (Pirate)",
    ],
    
    language_index: 0,
};

#macro TEXT_FILE "text.csv"
#macro SAVE_ON_MISSING_TEXT true
#macro Release:SAVE_ON_MISSING_TEXT false
#macro Text global.__text

Text = array_create(array_length(Settings.languages));
for (var i = 0, n = array_length(Text); i < n; i++) {
    Text[i] = { };
}

var text_grid = -1;

try {
    text_grid = load_csv(TEXT_FILE);
    
    for (var i = 0, w = ds_grid_width(text_grid); i < w; i++) {
        for (var j = 0, h = ds_grid_height(text_grid); j < h; j++) {
            Text[i][$ text_grid[# 0, j]] = string_replace_all(text_grid[# i, j], "\\n", "\n");
        }
    }
    
    ds_grid_destroy(text_grid);
} catch (e) {
    show_debug_message("Couldn't load the language text");
} finally {
    if (ds_exists(text_grid, ds_type_grid)) {
        ds_grid_destroy(text_grid);
    }
}