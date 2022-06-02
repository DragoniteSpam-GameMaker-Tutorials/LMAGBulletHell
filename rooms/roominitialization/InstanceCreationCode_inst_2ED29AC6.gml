OnClick = function() {
    GameController.GoToNextLevel();
};

Update = function() {
    if (room_last == room) {
        self.enabled = false;
        self.text = L("You beat the last level!");
    } else {
        self.enabled = true;
        self.text = L(self.source_text);
    }
}