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
    name: "Level 1: Woodlands",
    meshes: meshes_woodlands,
    color: $004000,
    id: 0
};
self.level_types[$ string(RoomLevel2)] = {
    name: "Level 2: Woodlands",
    meshes: meshes_woodlands,
    color: $004000,
    id: 1
};
self.level_types[$ string(RoomLevel3)] = {
    name: "Level 3...",
    meshes: meshes_woodlands,
    color: $004000,
    id: 2
};
self.level_types[$ string(RoomLevel3)] = {
    name: "Level 3...",
    meshes: meshes_woodlands,
    color: $004000,
    id: 3
};
self.level_types[$ string(RoomLevel4)] = {
    name: "Level 4...",
    meshes: meshes_woodlands,
    color: $004000,
    id: 4
};
self.level_types[$ string(RoomLevel5)] = {
    name: "Level 5...",
    meshes: meshes_woodlands,
    color: $004000,
    id: 5
};
self.level_types[$ string(RoomLevel6)] = {
    name: "Level 6...",
    meshes: meshes_woodlands,
    color: $004000,
    id: 6
};
self.level_types[$ string(RoomLevel7)] = {
    name: "Level 7...",
    meshes: meshes_woodlands,
    color: $004000,
    id: 7
};
self.level_types[$ string(RoomLevel8)] = {
    name: "Level 8...",
    meshes: meshes_woodlands,
    color: $004000,
    id: 8
};
self.level_types[$ string(RoomLevel9)] = {
    name: "Level 9...",
    meshes: meshes_woodlands,
    color: $004000,
    id: 9
};
self.level_types[$ string(RoomLevel10)] = {
    name: "Level 10...",
    meshes: meshes_woodlands,
    color: $004000,
    id: 10
};
self.level_types[$ string(RoomLevel11)] = {
    name: "Level 11...",
    meshes: meshes_woodlands,
    color: $004000,
    id: 11
};
self.level_types[$ string(RoomLevel12)] = {
    name: "Level 12...",
    meshes: meshes_woodlands,
    color: $004000,
    id: 12
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

self.save_data = [
    new PlayerSaveData(),
    new PlayerSaveData(),
    new PlayerSaveData(),
];

var load_buffer = -1;
try {
    load_buffer = buffer_load(SAVE_FILE_NAME);
    var load_json = json_parse(buffer_read(load_buffer, buffer_text));
    for (var i = 0; i < array_length(self.save_data); i++) {
        self.save_data[i].Load(load_json[i]);
    }
} catch (e) {
    show_debug_message("Couldn't load the player save data - " + e.message);
    self.save_data = [
        new PlayerSaveData(),
        new PlayerSaveData(),
        new PlayerSaveData(),
    ];
} finally {
    if (buffer_exists(load_buffer)) buffer_delete(load_buffer);
}

self.active_save_data = self.save_data[0];

self.SaveAll = function() {
    static save_buffer = buffer_create(1000, buffer_grow, 1);
    var save_json = json_stringify(self.save_data);
    buffer_seek(save_buffer, buffer_seek_start, 0);
    buffer_write(save_buffer, buffer_text, save_json);
    buffer_save_ext(save_buffer, SAVE_FILE_NAME, 0, buffer_tell(save_buffer));
};

self.EraseCurrentSave = function() {
    for (var i = 0; i < array_length(self.save_data); i++) {
        if (self.save_data[i] == self.active_save_data) {
            self.save_data[i] = new PlayerSaveData();
            break;
        }
    }
    self.SaveAll();
};

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
    // update the high score if you need to
    var current_high_score = self.active_save_data.high_score[$ room_get_name(room)];
    if (current_high_score == undefined || current_high_score < self.level.stats.score) {
        self.active_save_data.high_score[$ room_get_name(room)] = self.level.stats.score;
    }
    // update some other stats
    self.active_save_data.highest_score_multiplier = max(self.active_save_data.highest_score_multiplier, self.level.stats.highest_score_multiplier);
    self.active_save_data.cumulative_score += self.level.stats.score;
    self.active_save_data.total_stomps += self.level.stats.stomp_count;
    self.active_save_data.total_shots += self.level.stats.shots;
    self.active_save_data.total_damage_dealt += self.level.stats.damage_dealt;
    self.active_save_data.total_damage_taken += self.level.stats.damage_taken;
    self.active_save_data.total_level_cleared = max(self.active_save_data.total_level_cleared, self.level.level_data.id + 1);
    // autosave
    self.SaveAll();
    // actually show the win screen
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