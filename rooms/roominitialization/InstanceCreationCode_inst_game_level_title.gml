GetText = function() {
    self.text = string_replace_all(L(GameController.GetLevelMetadata(room).name), ": ", "\n");
};