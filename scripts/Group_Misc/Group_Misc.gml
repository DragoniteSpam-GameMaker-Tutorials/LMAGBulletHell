function is_playing() {
    return GameController.state == GameStates.PLAYING;
}

function is_paused() {
    return GameController.state == GameStates.PAUSED;
}