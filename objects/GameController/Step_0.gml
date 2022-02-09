if (keyboard_check_pressed(vk_escape)) {
    if (self.state == GameStates.PLAYING) {
        self.Pause();
    } else {
        self.Unpause();
    }
}

self.level.Update();