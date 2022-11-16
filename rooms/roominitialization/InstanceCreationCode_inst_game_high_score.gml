GetText = function() {
    if (!GameController.level) return;
    var level_clear_data = GameController.active_save_data.GetClearData(room);
	var default_score = GameController.level.level_data.star_score_requirement;
	
	if (!level_clear_data) {
		self.text_color = c_blue;
		self.text = L("High score: %0", string(default_score));
	} else {
		self.text_color = c_black;
		self.text = L("High score: %0", string(level_clear_data.high_score));
	}
};