GetText = function() {
    self.text = L("Damage Buff: Rank %0", Upgrades.damage_buff);
};

OnHover = function() {
    inst_upgrade_description.text = L("All attacks do more damage!");
};