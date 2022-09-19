GetText = function() {
    self.text = L("Special - Burn Damage: Rank %0", Upgrades.special_fire);
};

OnHover = function() {
    inst_upgrade_description.text = L("Allows your secondary inflict burns on the foes it hits!");
};