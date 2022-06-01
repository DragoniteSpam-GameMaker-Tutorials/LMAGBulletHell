GetText = function() {
    self.text = "Wave " + string(GameController.level.wave_index) + "/" + string(array_length(GameController.level.waves));
};