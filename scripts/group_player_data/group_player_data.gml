function PlayerSaveData() constructor {
    self.clear_data = { };
    self.cumulative_score = 0;
    self.highest_score_multiplier = 1;
    
    self.total_stomps = 0;
    self.total_shots = 0;
    self.total_damage_dealt = 0;
    self.total_damage_taken = 0;
    
    self.total_level_cleared = 0;
    
    self.currency = 0;
    self.total_currency = 0;
    
    static Respec = function() {
        self.currency = self.total_currency;
        Upgrades.Respec();
    };
    
    static Load = function(source) {
        if (is_real(source[$ "cumulative_score"])) self.cumulative_score = source.cumulative_score;
        if (is_real(source[$ "highest_score_multiplier"])) self.highest_score_multiplier = source.highest_score_multiplier;
        if (is_real(source[$ "total_stomps"])) self.total_stomps = source.total_stomps;
        if (is_real(source[$ "total_shots"])) self.total_shots = source.total_shots;
        if (is_real(source[$ "total_damage_dealt"])) self.total_damage_dealt = source.total_damage_dealt;
        if (is_real(source[$ "total_damage_taken"])) self.total_damage_taken = source.total_damage_taken;
        if (is_real(source[$ "total_level_cleared"])) self.total_level_cleared = source.total_level_cleared;
        
        if (is_real(source[$ "currency"])) self.currency = source.currency;
        if (is_real(source[$ "total_currency"])) self.total_currency = source.total_currency;
        
        if (is_struct(source[$ "clear_data"])) {
            var keys = variable_struct_get_names(source.clear_data);
            for (var i = 0, n = array_length(keys); i < n; i++) {
                if (room_exists(asset_get_index(keys[i])) && room_get_name(asset_get_index(keys[i])) == keys[i]) {
                    self.clear_data[$ keys[i]] = new self.ClearData();
                    
                    if (is_struct(source.clear_data[$ keys[i]])) {
                        self.clear_data[$ keys[i]].Load(source.clear_data[$ keys[i]]);
                    }
                }
            }
        }
		
		if (is_struct(source[$ "upgrades"])) {
			Upgrades.special_recharge_rate = source.upgrades[$ "special_recharge_rate"] ?? 0;
			Upgrades.special_charge_level = source.upgrades[$ "special_charge_level"] ?? 0;
			Upgrades.special_fire = source.upgrades[$ "special_fire"] ?? 0;
			Upgrades.damage_buff = source.upgrades[$ "damage_buff"] ?? 0;
			Upgrades.posthumous_recovery = source.upgrades[$ "posthumous_recovery"] ?? 0;
		}
    };
    
    static GetClearData = function(room_level) {
        if (!self.clear_data[$ room_get_name(room_level)]) {
			self.clear_data[$ room_get_name(room_level)] = new self.ClearData();
		}
		return self.clear_data[$ room_get_name(room_level)];
    };
    
    static ClearData = function() constructor {
        self.high_score = 0;
        self.clear = false;
        self.clear_without_damage = false;
        self.clear_under_time = false;
		self.clear_with_score = false;
        
        static Load = function(source) {
            if (is_real(source[$ "high_score"])) self.high_score = source.high_score;
            if (is_real(source[$ "clear"])) self.clear = source.clear;
            if (is_real(source[$ "clear_without_damage"])) self.clear_without_damage = source.clear_without_damage;
            if (is_real(source[$ "clear_under_time"])) self.clear_under_time = source.clear_under_time;
			if (is_real(source[$ "clear_with_score"])) self.clear_with_score = source.clear_with_score;
        };
    };
}