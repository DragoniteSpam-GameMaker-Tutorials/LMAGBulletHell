GetText = function() {
    self.text = L("Special - Max Charge Level: Rank %0", Upgrades.special_charge_level);
};

OnHover = function() {
    inst_upgrade_description.text = L("Increase your max charge level, allowing your secondary weapon to store up attacks to be unleashed quickly!");
};