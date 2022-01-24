if (instance_number(EntFoe) == 0) {
    if (self.level.Complete()) {
        // you win!
    } else {
        self.level.SendNextWave();
    }
}