function PlayerSaveData() constructor {
    self.high_score = { };
    self.cumulative_score = 0;
    self.highest_score_multiplier = 1;
    
    self.total_stomps = 0;
    self.total_shots = 0;
    self.total_damage_dealt = 0;
    self.total_damage_taken = 0;
    
    self.total_level_cleared = 0;
    
    static Load = function(source) {
        if (is_real(source[$ "cumulative_score"])) self.cumulative_score = source.cumulative_score;
        if (is_real(source[$ "highest_score_multiplier"])) self.highest_score_multiplier = source.highest_score_multiplier;
        if (is_real(source[$ "total_stomps"])) self.total_stomps = source.total_stomps;
        if (is_real(source[$ "total_shots"])) self.total_shots = source.total_shots;
        if (is_real(source[$ "total_damage_dealt"])) self.total_damage_dealt = source.total_damage_dealt;
        if (is_real(source[$ "total_damage_taken"])) self.total_damage_taken = source.total_damage_taken;
        if (is_real(source[$ "total_level_cleared"])) self.total_level_cleared = source.total_level_cleared;
    };
}