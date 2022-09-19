GetText = function() {
    self.text = L("Posthumous Recovery: Rank %0", Upgrades.posthumous_recovery);
};

OnHover = function() {
    inst_upgrade_description.text = L("If you fire an attack that kills a foe just before you die, you get a second chance at life!");
};