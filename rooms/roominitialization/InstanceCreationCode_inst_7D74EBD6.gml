OnClick = function() {
    GameController.GoToLevel(RoomLevel8);
};

Update = function() {
    var level_data = GameController.GetLevelMetadata(string(RoomLevel8));
    self.enabled = (GameController.active_save_data.total_level_cleared >= level_data.id) || DEBUG;
    self.text = L(string_replace(level_data.name, ": ", "\n"));
};