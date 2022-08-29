#macro Upgrades global.__upgrades__

Upgrades = {
    special_charge_level: 0,
    special_fire: 0,
    
    GetSubweaponChargeLevel: function() {
        switch (self.special_charge_level) {
            case 0: return  0.0 * SUB_ATTACK_COOLDOWN;
            case 1: return -0.5 * SUB_ATTACK_COOLDOWN;
            case 2: return -1.0 * SUB_ATTACK_COOLDOWN;
        }
    },
    GetSubweaponBurnCapacity: function() {
        switch (self.special_fire) {
            case 0: return { duration: 0.0, amount: 0 };
            case 1: return { duration: DEFAULT_EFFECT_DURATION, amount: 1 };
            case 2: return { duration: DEFAULT_EFFECT_DURATION * 2, amount: 2 };
        }
    },
    
};