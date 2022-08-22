event_inherited();

self.DrawBossUI = function(x, y) {
    var bar_x1 = x - 128;
    var bar_y1 = y;
    var bar_x2 = x + 128;
    var bar_y2 = y + 32;
    
    draw_healthbar(
        bar_x1, bar_y1, bar_x2, bar_y2,
        self.health / self.health_max * 100,
        c_white, c_red, c_green, 0, true, true
    );
};

self.hp_stage = 0;

self.UpdateHPStage = function() {
    var f = self.health / self.health_max;
    var last_stage = self.hp_stage;
    if (f < 0.25) {
        self.hp_stage = 3;
        if (last_stage != self.hp_stage) {
            self.OnHPStageChange();
        }
    } else if (f < 0.50) {
        self.hp_stage = 2;
        if (last_stage != self.hp_stage) {
            self.OnHPStageChange();
        }
    } else if (f < 0.75) {
        self.hp_stage = 1;
        if (last_stage != self.hp_stage) {
            self.OnHPStageChange();
        }
    } else {
        self.hp_stage = 0;
        if (last_stage != self.hp_stage) {
            self.OnHPStageChange();
        }
    }
};

self.OnHPStageChange = function() {
};