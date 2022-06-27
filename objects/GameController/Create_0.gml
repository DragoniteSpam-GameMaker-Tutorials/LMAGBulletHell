window_set_size(1366, 768);
display_set_gui_maximize();
application_surface_draw_enable(false);

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_color();
self.format = vertex_format_end();

self.meshes = {
    woodlands: {
    },
};

var filename = file_find_first("meshes/woodlands/*.vbuff", 0);
while (filename != "") {
    var buffer = buffer_load("meshes/woodlands/" + filename);
    var vbuff = vertex_create_buffer_from_buffer(buffer, self.format);
    self.meshes.woodlands[$ filename] = vbuff;
    buffer_delete(buffer);
    filename = file_find_next();
}
file_find_close();

self.ui = new UIManager();

state = GameStates.TITLE;
pause_screen = "UI_Pause";
title_screen = "UI_Title";
end_of_level_screen = "";
self.level = undefined;

save_data = [
    { },
    { },
    { },
];
active_save_data = save_data[0];

enum GameStates {
    PLAYING,
    PAUSED,
    TITLE,
}

Pause = function() {
    if (self.end_of_level_screen != "") return;
    time_source_pause(time_source_game);
    self.state = GameStates.PAUSED;
    self.pause_screen = "UI_Pause";
};

Unpause = function() {
    self.state = GameStates.PLAYING;
    time_source_start(time_source_game);
};

RestartLevel = function() {
    with (LevelObject) instance_destroy();
    room_restart();
};

ShowWinScreen = function() {
    self.end_of_level_screen = "UI_Win";
};

ShowLoseScreen = function() {
    self.end_of_level_screen = "UI_Lose";
};

GoToLevel = function(target_room) {
    self.state = GameStates.PLAYING;
    room_goto(target_room);
};

GoToNextLevel = function() {
    self.state = GameStates.PLAYING;
    room_goto_next();
};

GoToTitle = function() {
    self.state = GameStates.TITLE;
    self.level = undefined;
    room_goto(RoomTitle);
};

room_goto(RoomTitle);