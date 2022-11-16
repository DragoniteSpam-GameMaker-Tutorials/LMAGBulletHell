GetText = function() {
	var clear_data = GameController.active_save_data.GetClearData(room);
	self.text_color = clear_data.clear_without_damage ? c_black : c_gray;
	self.text = L(self.source_text);
};

OnHover = function() {
    inst_win_screen_star_description.text = L("Clear the level without\ntaking any damage!");
};