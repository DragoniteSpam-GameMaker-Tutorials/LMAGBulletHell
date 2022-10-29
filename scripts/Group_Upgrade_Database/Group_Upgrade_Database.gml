#macro Upgrades global.__upgrades__

Upgrades = {
    special_recharge_rate: 0,
    special_charge_level: 0,
    special_fire: 0,
    damage_buff: 0,
    posthumous_recovery: 0,
    
    Respec: function() {
        self.special_recharge_rate = 0;
        self.special_charge_level = 0;
        self.special_fire = 0;
        self.damage_buff = 0;
        self.posthumous_recovery = 0;
    },
    
    GetSubweaponChargeLevel: function() {
        switch (self.special_charge_level) {
            case 0: return  0.0 * SUB_ATTACK_COOLDOWN;
            case 1: return -0.5 * SUB_ATTACK_COOLDOWN;
            case 2: return -1.0 * SUB_ATTACK_COOLDOWN;
            default: return  0.0 * SUB_ATTACK_COOLDOWN;
        }
    },
    
    GetSubweaponRechargeRate: function() {
        switch (self.special_recharge_rate) {
            case 0: return 1.0;
            case 1: return 1.5;
            case 2: return 2.0;
            default: return 1.0;
        }
    },
    
    GetSubweaponBurnCapacity: function() {
        switch (self.special_fire) {
            case 0: return { duration: 0.0, amount: 0 };
            case 1: return { duration: DEFAULT_EFFECT_DURATION, amount: 1 };
            case 2: return { duration: DEFAULT_EFFECT_DURATION * 2, amount: 2 };
            default: return { duration: 0.0, amount: 0 };
        }
    },
    
    GetDamageBuff: function() {
        switch (self.damage_buff) {
            case 0: return 1.0;
            case 1: return 1.3;
            case 2: return 1.6;
            default: return 1.0;
        }
    },
    
    GetPosthumousRecoveryTime: function() {
        switch (self.posthumous_recovery) {
            case 0: return 0;
            case 1: return 1;
            case 2: return 2;
            default: return 0;
        }
    },
};