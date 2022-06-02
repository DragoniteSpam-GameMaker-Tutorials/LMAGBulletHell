GetText = function() {
    if (!GameController.level) return;
    self.text = L("High score: %0", "TBA");
};