OnClick = function() {
    GameController.GoToLevel(RoomLevel10);
};

Update = function() {
    var level_data = GameController.level_types[$ string(RoomLevel10)];
    self.enabled = (GameController.active_save_data.total_level_cleared >= level_data.id) || DEBUG;
    self.text = L(string_replace(level_data.name, ": ", "\n"));
};