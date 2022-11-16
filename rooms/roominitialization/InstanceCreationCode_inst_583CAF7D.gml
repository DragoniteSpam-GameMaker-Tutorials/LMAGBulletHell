GetText = function() {
    self.text = L("Special - Burn Damage: Rank %0", Upgrades.special_fire);
};

OnHover = function() {
	if (Upgrades.special_recharge_rate < 3) {
		inst_upgrade_description.text = L("Allows your secondary inflict burns on the foes it hits!\nUpgrade cost: %0", Upgrades.special_fire + 1);
	} else {
		inst_upgrade_description.text = L("Allows your secondary inflict burns on the foes it hits!");
	}
};