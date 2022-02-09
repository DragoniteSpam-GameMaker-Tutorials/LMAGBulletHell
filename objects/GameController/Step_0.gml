if (keyboard_check_pressed(vk_escape)) {
    if (self.state == GameStates.PLAYING) {
        self.state = GameStates.PAUSED;
    } else {
        self.state = GameStates.PLAYING;
    }
}

self.level.Update();