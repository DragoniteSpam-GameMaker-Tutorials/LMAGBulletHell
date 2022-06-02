OnClick = function() {
    if (GameController.state == GameStates.TITLE) {
        GameController.title_screen = "UI_Level_Select";
    } else {
        GameController.pause_screen = "UI_Pause";
    }
};