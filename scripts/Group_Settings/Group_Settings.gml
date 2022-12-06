#macro Settings global.__settings

#macro default_frame_rate			60
#macro pi:default_frame_rate		30
#macro default_frame_rate_index		1
#macro pi:default_frame_rate_index	0
#macro default_scale				1
#macro pi:default_scale				0.25
#macro default_scale_index			5
#macro pi:default_scale_index		0

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
			audio_sound_gain(se_ambient, self.se, 0);
        },
    },
    
    video: {
        default_frame_rates: [
            30, 60, 120, 144,
        ],
        frame_rate_index: default_frame_rate_index,
        frame_rate_value: default_frame_rate,
        
        ApplyFPS: function() {
            self.frame_rate_value = self.default_frame_rates[self.frame_rate_index];
            game_set_speed(self.frame_rate_value, gamespeed_fps);
        },
        
        default_scales: [
            0.25, 0.33, 0.40, 0.50, 0.75, 1.00
        ],
        scale_index: default_scale_index,
        scale_value: default_scale,
        
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
	
    Save: function() {
        var json = {
            audio: self.audio,
            language_index: self.language_index,
			
			video: {
				frame_rate_index: self.video.frame_rate_index,
				frame_rate_value: self.video.frame_rate_value,
				scale_index: self.video.scale_index,
				scale_value: self.video.scale_value,
				size_index: self.video.size_index,
				size_value: self.video.size_value,
				fullscreen: window_get_fullscreen()
			},
        };
        var save_buffer = buffer_create(100, buffer_grow, 1);
        buffer_write(save_buffer, buffer_text, json_stringify(json));
        buffer_save_ext(save_buffer, SETTINGS_FILE_NAME, 0, buffer_tell(save_buffer));
        buffer_delete(save_buffer);
    },
	
	Load: function() {
		try {
			var load_buffer = buffer_load(SETTINGS_FILE_NAME);
			var json = json_parse(buffer_read(load_buffer, buffer_text));
			
			try {
				self.audio.master = clamp(string(json.audio.master), 0, 1);
			} catch (e) { self.audio.master = 1; }
			try {
				self.audio.bgm = clamp(string(json.audio.bgm), 0, 1);
			} catch (e) { self.audio.bgm = 1; }
			try {
				self.audio.se = clamp(string(json.audio.se), 0, 1);
			} catch (e) { self.audio.se = 1; }
			
			try {
				self.video.frame_rate_index = clamp(string(json.video.frame_rate_index), 0, array_length(self.video.default_frame_rates) - 1);
			} catch (e) { }
			try {
				self.video.frame_rate_value = clamp(string(json.video.frame_rate_value), 1, 10000);
			} catch (e) { }
			try {
				self.video.scale_index = clamp(string(json.video.frame_rate_index), 0, array_length(self.video.default_scales) - 1);
			} catch (e) { }
			try {
				self.video.scale_value = clamp(string(json.video.scale_value), 0.05, 10);
			} catch (e) { }
			try {
				self.video.size_index = clamp(string(json.video.size_index), 0, array_length(self.video.default_screen_sizes) - 1);
			} catch (e) { }
			try {
				self.video.size_value.x = clamp(string(json.video.size_value.x), 0.05, 10);
			} catch (e) { }
			try {
				self.video.size_value.y = clamp(string(json.video.size_value.y), 0.05, 10);
			} catch (e) { }
			try {
				window_set_fullscreen(bool(json.video.fullscreen));
			} catch (e) { }
			
			try {
				self.language_index = clamp(string(json.language_index), 0, array_length(self.languages) - 1);
			} catch (e) { }
			
			buffer_delete(load_buffer);
		} catch (e) {
		}
		
		self.video.ApplyFPS();
		self.video.ApplyScreenSize();
		self.audio.ApplyVolume();
	},
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