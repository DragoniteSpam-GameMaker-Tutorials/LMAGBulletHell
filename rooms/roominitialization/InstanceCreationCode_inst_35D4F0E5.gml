GetText = function() {
    self.text = L("Special - Max Charge Level: Rank %0", Upgrades.special_charge_level);
};

OnHover = function() {
	if (Upgrades.special_recharge_rate < 3) {
		inst_upgrade_description.text = L("Increase your max charge level, allowing your secondary weapon to store up attacks to be unleashed quickly!\nUpgrade cost: %0", Upgrades.special_charge_level + 1);
	} else {
		inst_upgrade_description.text = L("Increase your max charge level, allowing your secondary weapon to store up attacks to be unleashed quickly!");
	}
};