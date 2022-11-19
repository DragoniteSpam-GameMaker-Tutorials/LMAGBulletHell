GetText = function() {
	var clear_data = GameController.active_save_data.GetClearData(room);
	self.text_color = clear_data.clear_under_time ? c_black : c_gray;
	self.text = L(self.source_text);
};

OnHover = function() {
	static mm = LEVEL_CLEAR_TIME div 60;
	static ss = LEVEL_CLEAR_TIME mod 60;
	ss = string(ss);
	while (string_length(ss) < 2) ss = "0" + ss;
	var t = string(mm) + ss;
    inst_win_screen_star_description.text = L("Clear the level in less\nthan %0!", ss);
};