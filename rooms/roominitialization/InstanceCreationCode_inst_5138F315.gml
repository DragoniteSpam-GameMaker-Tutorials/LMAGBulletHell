OnClick = function() {
    GameController.GoToLevel(RoomLevel10);
};

Update = function() {
    var level_data = GameController.GetLevelMetadata(string(RoomLevel10));
    self.enabled = (GameController.active_save_data.total_level_cleared >= level_data.id) || DEBUG;
    self.text = string_replace(L(level_data.name), ": ", "\n");
};