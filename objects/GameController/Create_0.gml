window_set_size(1366, 768);
display_set_gui_maximize();
application_surface_draw_enable(false);

self.ui = new UIManager();

state = GameStates.PLAYING;
pause_screen = "UI_Pause";

enum GameStates {
    PLAYING,
    PAUSED,
    TITLE,
}

Pause = function() {
    self.state = GameStates.PAUSED;
    self.pause_screen = "UI_Pause";
};

Unpause = function() {
    self.state = GameStates.PLAYING;
};

RestartLevel = function() {
    with (LevelObject) instance_destroy();
    room_restart();
};