GetText = function() {
    if (!GameController.level) return;
    self.text = L("Bugs stomped:\n%0", GameController.level.stats.stomp_count);
};