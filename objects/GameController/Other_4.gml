if (self.state != GameStates.TITLE) {
    self.level = new Level(self.meshes.woodlands, $004000);
    self.level.SendNextWave();
    self.end_of_level_screen = "";
}