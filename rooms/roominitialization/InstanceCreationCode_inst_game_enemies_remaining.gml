GetText = function() {
    if (!GameController.level) return;
    self.text = L("Bugs remaining:\n%0", foe_count());
};