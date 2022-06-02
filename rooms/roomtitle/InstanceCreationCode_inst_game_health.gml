GetText = function() {
    if (!GameController.level) return;
    self.text = L("Health: %0", EntPlayer.health);
};