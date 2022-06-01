if (self.state != GameStates.TITLE) {
    self.level = new Level();
    self.level.SendNextWave();
    self.end_of_level_screen = "";
}