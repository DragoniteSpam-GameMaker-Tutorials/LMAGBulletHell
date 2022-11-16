GetText = function() {
    self.text = L("Posthumous Recovery: Rank %0", Upgrades.posthumous_recovery);
};

OnHover = function() {
	if (Upgrades.special_recharge_rate < 3) {
		inst_upgrade_description.text = L("If you fire an attack that kills a foe just before you die, you get a second chance at life!\nUpgrade cost: %0", Upgrades.posthumous_recovery + 1);
	} else {
		inst_upgrade_description.text = L("If you fire an attack that kills a foe just before you die, you get a second chance at life!");
	}
};