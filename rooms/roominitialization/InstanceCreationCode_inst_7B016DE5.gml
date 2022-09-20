OnClick = function() {
    GameController.GoToLevel(RoomLevel9);
};

Update = function() {
    var level_data = GameController.GetLevelMetadata(string(RoomLevel9));
    self.enabled = (GameController.active_save_data.total_level_cleared >= level_data.id) || DEBUG;
    self.text = string_replace(L(level_data.name), ": ", "\n");
};