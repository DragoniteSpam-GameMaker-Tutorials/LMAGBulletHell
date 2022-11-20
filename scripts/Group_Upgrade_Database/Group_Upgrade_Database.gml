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
			default:
            case 0: return  0.0 * SUB_ATTACK_COOLDOWN;
            case 1: return -0.5 * SUB_ATTACK_COOLDOWN;
            case 2: return -1.0 * SUB_ATTACK_COOLDOWN;
			case 3: return -1.5 * SUB_ATTACK_COOLDOWN;
        }
    },
    
    GetSubweaponRechargeRate: function() {
        switch (self.special_recharge_rate) {
			default:
            case 0: return 1.0;
            case 1: return 1.5;
            case 2: return 2.0;
			case 3: return 2.5;
        }
    },
    
    GetSubweaponBurnCapacity: function() {
        switch (self.special_fire) {
			default:
            case 0: return { duration: DEFAULT_EFFECT_DURATION * 0.0, amount: 0 };
            case 1: return { duration: DEFAULT_EFFECT_DURATION * 1.0, amount: 1 };
            case 2: return { duration: DEFAULT_EFFECT_DURATION * 2.0, amount: 2 };
            case 3: return { duration: DEFAULT_EFFECT_DURATION * 3.0, amount: 2.5 };
        }
    },
    
    GetDamageBuff: function() {
        switch (self.damage_buff) {
			default:
            case 0: return 1.0;
            case 1: return 1.3;
            case 2: return 1.6;
			case 3: return 2.0;
        }
    },
    
    GetPosthumousRecoveryTime: function() {
        switch (self.posthumous_recovery) {
			default:
            case 0: return 0.0;
            case 1: return 0.5;
            case 2: return 1.0;
            case 3: return 2.0;
        }
    },
};