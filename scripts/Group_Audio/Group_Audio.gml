function audio_play_player_shoot() {
    audio_play_sound(se_player_shoot, 100, false, Settings.audio.se);
}

function audio_play_player_hit() {
    audio_play_sound(se_player_hit, 100, false, Settings.audio.se);
}

function audio_play_player_special_fire() {
    audio_play_sound(se_player_special_fire, 100, false, Settings.audio.se);
}

function audio_play_foe_hit() {
    audio_play_sound(se_foe_hit, 100, false, Settings.audio.se);
}

function audio_play_foe_shoot() {
    audio_play_sound(se_foe_shoot, 100, false, Settings.audio.se);
}

function audio_play_foe_die() {
    audio_play_sound(se_foe_die, 100, false, Settings.audio.se);
}

function audio_play_explosion() {
    audio_play_sound(se_explosion, 100, false, Settings.audio.se);
}

function audio_play_game_pause() {
    audio_play_sound(se_game_pause, 100, false, Settings.audio.se);
}

function audio_play_game_unpause() {
    audio_play_sound(se_game_unpause, 100, false, Settings.audio.se);
}

function audio_play_menu_button() {
    audio_play_sound(se_menu_generic, 100, false, Settings.audio.se);
}

function audio_play_menu_back() {
    audio_play_sound(se_menu_back, 100, false, Settings.audio.se);
}

function audio_play_menu_forward() {
    audio_play_sound(se_menu_forward, 100, false, Settings.audio.se);
}

function audio_play_pickup() {
    audio_play_sound(se_pickup, 100, false, Settings.audio.se);
}

function audio_play_pickup_health() {
    audio_play_sound(se_pickup_health, 100, false, Settings.audio.se);
}

function audio_play_win() {
    audio_play_sound(se_win, 100, false, Settings.audio.se);
}

global.bgm_currently_playing = -1;

function audio_play_bgm(audio) {
	if (global.bgm_currently_playing != -1) {
		var fadeout_time = 1000;
		audio_sound_gain(global.bgm_currently_playing, 0, fadeout_time);
		call_later(fadeout_time, time_source_units_seconds, method({ snd: global.bgm_currently_playing }, function() {
			audio_stop_sound(self.snd);
		}));
	}
	global.bgm_currently_playing = audio_play_sound(audio, 150, true, Settings.audio.bgm);
}