GetText = function() {
    if (!GameController.level) return;
    var level_clear_data = GameController.active_save_data.GetClearData(room);
    self.text = L("High score: %0", (level_clear_data != undefined) ? string(level_clear_data.high_score) : "0");
};