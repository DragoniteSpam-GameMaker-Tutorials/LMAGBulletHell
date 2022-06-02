GetText = function() {
    self.text = L("Charge level: %0%", floor((SUB_ATTACK_COOLDOWN - EntPlayer.shot_cooldown_sub) / SUB_ATTACK_COOLDOWN * 100));
};