window_set_size(1366, 768);
display_set_gui_maximize();
application_surface_draw_enable(false);

state = GameStates.PLAYING;

enum GameStates {
    PLAYING,
    PAUSED,
    TITLE,
}

Pause = function() {
    self.state = GameStates.PAUSED;
};

Unpause = function() {
    self.state = GameStates.PLAYING;
};