GetText = function() {
    self.text = "Charge level: " + string(floor((SUB_ATTACK_COOLDOWN - EntPlayer.shot_cooldown_sub) / SUB_ATTACK_COOLDOWN * 100)) + "%";
};