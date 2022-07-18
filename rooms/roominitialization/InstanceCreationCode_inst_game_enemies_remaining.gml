GetText = function() {
    if (!GameController.level) return;
    self.text = L("Bugs remaining:\n%0", instance_number(EntFoeTemplate));
};