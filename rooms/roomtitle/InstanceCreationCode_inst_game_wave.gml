GetText = function() {
    self.text = L("Wave %0", string(GameController.level.wave_index) + "/" + string(array_length(GameController.level.waves)));
};