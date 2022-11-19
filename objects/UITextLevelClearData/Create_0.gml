event_inherited();

GetText = function() {
    var clear_data = GameController.active_save_data.GetClearData(self.room_level);
    
    if (clear_data == undefined) {
        self.text = L("(Locked)");
    } else {
        self.text = L(
            "%0\nNo damage? %1\nFast clear? %2\nHigh score: %3", [
            room_get_name(self.room_level),
            clear_data.clear_without_damage ? L("Yes") : L("No"),
            clear_data.clear_under_time ? L("Yes") : L("No"),
            false ? L("Yes") : L("No")
        ]);
    }
}

OnHover = function() {
    
};