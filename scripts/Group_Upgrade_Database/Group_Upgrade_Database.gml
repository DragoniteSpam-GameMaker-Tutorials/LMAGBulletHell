#macro Upgrades global.__upgrades__

Upgrades = {
    special_fire: 1,
    GetSubweaponBurnCapacity: function() {
        switch (self.special_fire) {
            case 0: return { duration: 0.0, amount: 0 };
            case 1: return { duration: DEFAULT_EFFECT_DURATION, amount: 1 };
            case 2: return { duration: DEFAULT_EFFECT_DURATION * 2, amount: 2 };
        }
    },
    
};