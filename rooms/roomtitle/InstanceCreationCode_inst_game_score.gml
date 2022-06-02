GetText = function() {
    if (!GameController.level) return;
    self.text = L("Score: %0", floor(GameController.level.score));
};