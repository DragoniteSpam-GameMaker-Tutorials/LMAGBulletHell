GetText = function() {
    self.text = L("Special Recharge Rate: Rank %0", Upgrades.special_recharge_rate);
};

OnHover = function() {
	if (Upgrades.special_recharge_rate < 3) {
		inst_upgrade_description.text = L("Allows your secondary attack to recharge faster!\nUpgrade cost: %0", Upgrades.special_recharge_rate + 1);
	} else {
		inst_upgrade_description.text = L("Allows your secondary attack to recharge faster!");
	}
};