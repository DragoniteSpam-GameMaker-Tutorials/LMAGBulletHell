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
};