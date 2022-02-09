#macro Settings global.__settings

Settings = {
    audio: {
        master: 1,
        bgm: 1,
        se: 1,
        
        ApplyVolume: function() {
            audio_set_master_gain(0, self.master);
        },
    },
    
    video: {
        default_frame_rates: [
            30, 60, 120, 144,
        ],
        frame_rate_index: 1,
        
        ApplyFPS: function() {
            game_set_speed(self.default_frame_rates[self.frame_rate_index], gamespeed_fps);
        },
    },
};