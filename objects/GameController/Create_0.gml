window_set_size(1366, 768);
display_set_gui_maximize();
application_surface_draw_enable(false);

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_color();
self.format = vertex_format_end();

var meshes_woodlands = load_level_meshes("meshes/woodlands/", self.format);
self.level_types = { };
self.level_types[$ string(RoomLevel1)] = {
    meshes: meshes_woodlands,
    color: $004000,
};
self.level_types[$ string(RoomLevel2)] = {
    meshes: meshes_woodlands,
    color: $004000,
};
/*
    desert: {
        meshes: load_level_meshes("meshes/desert/", self.format),
        color: $ffdd99,
    },
    beach: {
        meshes: load_level_meshes("meshes/beach/", self.format),
        color: $ffeecc,
    },*/

self.ui = new UIManager();

state = GameStates.TITLE;
pause_screen = "UI_Pause";
title_screen = "UI_Title";
end_of_level_screen = "";
self.level = undefined;

save_data = [
    new PlayerSaveData(),
    new PlayerSaveData(),
    new PlayerSaveData(),
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