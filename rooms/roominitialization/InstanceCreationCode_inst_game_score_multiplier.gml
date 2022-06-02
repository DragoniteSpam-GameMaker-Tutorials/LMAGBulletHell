GetText = function() {
    if (!GameController.level) return;
    self.text = L("Multiplier: %0", GameController.level.score_multiplier);
};