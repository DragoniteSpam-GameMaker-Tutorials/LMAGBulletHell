GetText = function() {
    self.text = L("Damage Buff: Rank %0", Upgrades.damage_buff);
};

OnHover = function() {
	if (Upgrades.special_recharge_rate < 3) {
		inst_upgrade_description.text = L("All attacks do more damage!\nUpgrade cost: %0", Upgrades.damage_buff + 1);
	} else {
		inst_upgrade_description.text = L("All attacks do more damage!");
	}
};