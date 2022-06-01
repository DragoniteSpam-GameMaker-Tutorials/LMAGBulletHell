GetText = function() {
    var seconds = floor(GameController.level.game_timer);
    if (seconds < 60) {
        self.text = "Time: " + string(seconds);
    } else {
        self.text = "Time: " + string(seconds div 60) + ":" + (((seconds % 60) < 10) ? "0" : "") + string(seconds % 60);
    }
};