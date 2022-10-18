if (self.state == GameStates.TITLE) {
    self.level = new Level(self.level_title);
} else {
    var level_data = self.level_types[$ string(room)];
    self.level = new Level(level_data);
    self.end_of_level_screen = "";
    if (self.countdown_time_source != -1) time_source_destroy(self.countdown_time_source);
    self.countdown_time_source = time_source_create(time_source_global, 3, time_source_units_seconds, function() {
        self.level.SendNextWave();
        self.level.ready_to_go = true;
        time_source_destroy(self.countdown_time_source);
        self.countdown_time_source = -1;
    });
    time_source_start(self.countdown_time_source);
}

if (self.state == GameStates.TITLE) {
    part_system_clear(Particles.system);
}