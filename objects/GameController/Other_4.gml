if (self.state != GameStates.TITLE) {
    var level_data = self.level_types[$ string(room)];
    self.level = new Level(level_data);
    self.level.SendNextWave();
    self.end_of_level_screen = "";
}