GetText = function() {
	var clear_data = GameController.active_save_data.GetClearData(room);
	self.text_color = clear_data.clear_with_score ? c_black : c_gray;
	self.text = L(self.source_text);
};

OnHover = function() {
    inst_win_screen_star_description.text = L("Clear the level with a\nscore of %0 or higher!", GameController.level.level_data.star_score_requirement);
};