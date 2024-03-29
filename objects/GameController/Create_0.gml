window_set_size(1366, 768);
display_set_gui_maximize();
application_surface_draw_enable(false);

self.pseudo_window_width = window_get_width();
self.pseudo_window_height = window_get_height();

self.background_surface = surface_create(1366, 768);
self.background_camera = camera_create();
camera_set_view_pos(self.background_camera, 0, 0);
camera_set_view_size(self.background_camera, 1366, 768);

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_color();
self.format = vertex_format_end();

audio_play_sound(se_ambient, 100, true);

self.foe_meshes = {
    ant: load_foe_meshes("meshes/foes/ant*.vbuff", self.format),
    aphid: load_foe_meshes("meshes/foes/aphid*.vbuff", self.format),
    bagworm: load_foe_meshes("meshes/foes/bagworm*.vbuff", self.format),
    gnat: load_foe_meshes("meshes/foes/gnat*.vbuff", self.format),
    grasshopper: load_foe_meshes("meshes/foes/grasshopper*.vbuff", self.format),
    pillbug: load_foe_meshes("meshes/foes/pillbug*.vbuff", self.format),
    scarab: load_foe_meshes("meshes/foes/scarab*.vbuff", self.format),
    centipede_head: load_foe_meshes("meshes/foes/centipede-head*.vbuff", self.format),
    centipede_body: load_foe_meshes("meshes/foes/centipede-body*.vbuff", self.format),
    hornet: load_foe_meshes("meshes/foes/hornet*.vbuff", self.format),
    hornetqueen: load_foe_meshes("meshes/foes/hornetqueen*.vbuff", self.format),
    hornetfinal: load_foe_meshes("meshes/foes/hornetfinal*.vbuff", self.format),
    scorpion: load_foe_meshes("meshes/foes/scorpion*.vbuff", self.format),
    cockroach: load_foe_meshes("meshes/foes/cockroach*.vbuff", self.format),
};

self.player_meshes = {
    test_player: load_foe_meshes("meshes/players/player*.vbuff", self.format),
};

var meshes_woodlands = load_level_meshes("meshes/woodlands/", self.format);
var meshes_cactuslands = load_level_meshes("meshes/cactusland/", self.format);
var meshes_flowerland = load_level_meshes("meshes/flowerland/", self.format);
var meshes_swampland = load_level_meshes("meshes/swampland/", self.format);

var color_woods = #004000;
var color_flowers = #004800;
var color_cactus = #ffd9b3;
var color_swamp = #806000;

self.level_title = new LevelMetadata("TITLE", -1, meshes_flowerland, color_flowers)
	.SetBGM(bgm_title);

self.level_types = { };
self.level_types[$ string(RoomLevel1)] = new LevelMetadata("Level 1: Cannon Fodder", 0, meshes_woodlands, color_woods)
	.SetBGM(bgm_level_grasslands)
	.SetStarScoreRequirement(2000);
self.level_types[$ string(RoomLevel2)] = new LevelMetadata("Level 2: Bagworm Bombs", 1, meshes_woodlands, color_woods)
	.SetBGM(bgm_level_grasslands)
	.SetStarScoreRequirement(2000);
self.level_types[$ string(RoomLevel3)] = new LevelMetadata("Level 3: Hornet's Nest", 2, meshes_woodlands, color_woods)
	.SetBGM(bgm_level_grasslands)
	.SetStarScoreRequirement(2000);

self.level_types[$ string(RoomLevel4)] = new LevelMetadata("Level 4: Smidge Annoying", 3, meshes_flowerland, color_flowers, 1.25)
	.SetBGM(bgm_level_grasslands)
	.SetStarScoreRequirement(2400);
self.level_types[$ string(RoomLevel5)] = new LevelMetadata("Level 5: Grasshoppers", 4, meshes_flowerland, color_flowers, 1.25)
	.SetBGM(bgm_level_grasslands)
	.SetStarScoreRequirement(2000);
self.level_types[$ string(RoomLevel6)] = new LevelMetadata("Level 6: Beehive Bonanza", 5, meshes_flowerland, color_flowers, 1.25)
	.SetBGM(bgm_level_boss)
	.SetStarScoreRequirement(2400);

self.level_types[$ string(RoomLevel7)] = new LevelMetadata("Level 7: Centipedes", 6, meshes_swampland, color_swamp)
	.SetBGM(bgm_level_desert)
	.SetStarScoreRequirement(1200);
self.level_types[$ string(RoomLevel8)] = new LevelMetadata("Level 8: Beetle Juice", 7, meshes_swampland, color_swamp)
	.SetBGM(bgm_level_desert)
	.SetStarScoreRequirement(1200);

self.level_types[$ string(RoomLevel9)] = new LevelMetadata("Level 9: Cockroach Chaos", 8, meshes_cactuslands, color_cactus, 0.3)
	.SetBGM(bgm_level_boss)
	.SetStarScoreRequirement(3000);
self.level_types[$ string(RoomLevel10)] = new LevelMetadata("Level 10: Scorpion Rush", 9, meshes_cactuslands, color_cactus, 0.3)
	.SetBGM(bgm_level_desert)
	.SetStarScoreRequirement(1200);

self.level_types[$ string(RoomLevel11)] = new LevelMetadata("Level 11: The Infestation", 10, meshes_woodlands, color_swamp)
	.SetBGM(bgm_level_grasslands)
	.SetStarScoreRequirement(2400);
self.level_types[$ string(RoomLevel12)] = new LevelMetadata("Level 12: Hornet Queen's\nRevenge", 11, meshes_flowerland, color_flowers, 1.5)
	.SetBGM(bgm_level_boss)
	.SetStarScoreRequirement(1200);

self.GetLevelMetadata = function(room_level) {
    return self.level_types[$ string(room_level)];
};

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
	self.active_save_data.upgrades = Upgrades;
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
	self.active_save_data.Respec();
    self.SaveAll();
};

enum GameStates {
    PLAYING,
    PAUSED,
    TITLE,
}

Pause = function() {
    if (self.end_of_level_screen != "") return;
    if (self.countdown_time_source != -1) time_source_destroy(self.countdown_time_source);
    self.countdown_time_source = -1;
    time_source_pause(time_source_game);
    self.state = GameStates.PAUSED;
    self.pause_screen = "UI_Pause";
    audio_play_game_pause();
};

self.countdown_time_source = -1;

Unpause = function() {
    if (self.countdown_time_source != -1) return;
    self.pause_screen = "";
    self.countdown_time_source = time_source_create(time_source_global, 3, time_source_units_seconds, function() {
        self.state = GameStates.PLAYING;
        time_source_start(time_source_game);
        audio_play_game_unpause();
        time_source_destroy(self.countdown_time_source);
        self.countdown_time_source = -1;
        self.level.ready_to_go = true;
    });
    time_source_start(self.countdown_time_source);
};

RestartLevel = function() {
    with (LevelObject) instance_destroy();
    room_restart();
	if (self.countdown_time_source != -1) {
		time_source_destroy(self.countdown_time_source);
	}
	self.state = GameStates.PLAYING;
};

ShowWinScreen = function() {
    with (Bullet) instance_destroy();
    
    // update the high score if you need to, and other level clear data
    var clear_data = self.active_save_data.GetClearData(room);
    if (clear_data == undefined) {
        clear_data = new self.active_save_data.ClearData();
        self.active_save_data.clear_data[$ room_get_name(room)] = clear_data;
    }
    
    clear_data.high_score = max(clear_data.high_score, self.level.stats.score);
    
    var clear_without_damage = self.level.stats.damage_taken == 0;
    var clear_under_time = self.level.game_timer <= 105;
	var clear_with_score = self.level.stats.score >= self.level.level_data.star_score_requirement;
    
    if (!clear_data.clear_without_damage && clear_without_damage) {
        clear_data.clear_without_damage = true;
        self.active_save_data.currency++;
        self.active_save_data.total_currency++;
    }
    if (!clear_data.clear_under_time && clear_under_time) {
        clear_data.clear_under_time = true;
        self.active_save_data.currency++;
        self.active_save_data.total_currency++;
    }
    if (!clear_data.clear_with_score && clear_with_score) {
        clear_data.clear_with_score = true;
        self.active_save_data.currency++;
        self.active_save_data.total_currency++;
    }
    
    clear_data.clear = true;
    
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
    
    audio_play_win();
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

Settings.Load();

room_goto(RoomTitle);