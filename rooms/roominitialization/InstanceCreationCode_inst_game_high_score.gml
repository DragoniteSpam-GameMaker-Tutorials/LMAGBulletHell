GetText = function() {
    if (!GameController.level) return;
    var current_high_score = GameController.active_save_data.high_score[$ string(room_get_name(room))];
    self.text = L("High score: %0", (current_high_score != undefined) ? string(current_high_score) : "---");
};