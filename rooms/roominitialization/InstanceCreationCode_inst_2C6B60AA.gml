GetText = function() {
    self.text = L("Special Recharge Rate: Rank %0", Upgrades.special_recharge_rate);
};

OnHover = function() {
    inst_upgrade_description.text = L("Allows your secondary attack to recharge faster!");
};