event_inherited();

self.interstage_cooldown = 0;

self.inheritedShoot = self.Shoot;
self.Shoot = function() {
    if (self.interstage_cooldown > 0) return;
    self.inheritedShoot();
};

self.inheritedDamage = self.OnDamage;
self.OnDamage = function(bullet) {
    if (self.interstage_cooldown > 0) return;
    self.inheritedDamage(bullet);
};

self.DrawBossUI = function(x, y) {
    var bar_x1 = x - 256;
    var bar_y1 = y;
    var bar_x2 = x + 256;
    var bar_y2 = y + 32;
    
    draw_healthbar(
        bar_x1, bar_y1, bar_x2, bar_y2,
        self.health / self.health_max * 100,
        c_white, c_red, c_green, 0, true, true
    );
    
    var bar_w = bar_x2 - bar_x1;
    var bar_xf1 = bar_x1 + bar_w / 4;
    var bar_xf2 = bar_x1 + 2 * bar_w / 4;
    var bar_xf3 = bar_x1 + 3 * bar_w / 4;
    draw_line_colour(bar_xf1, bar_y1, bar_xf1, bar_y2, c_black, c_black);
    draw_line_colour(bar_xf2, bar_y1, bar_xf2, bar_y2, c_black, c_black);
    draw_line_colour(bar_xf3, bar_y1, bar_xf3, bar_y2, c_black, c_black);
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
    self.interstage_cooldown = DEFAULT_BOSS_STAGE_COOLDOWN;
    GameController.level.SendNextWave();
};