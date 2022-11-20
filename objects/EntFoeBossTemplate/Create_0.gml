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
	
	var f = self.health / self.health_max;
	var fill_color = c_green;
	
	if (f < 0.25) {
		fill_color = c_red;
	} else if (f < 0.5) {
		fill_color = c_yellow;
	}
	
    draw_healthbar(
        bar_x1, bar_y1, bar_x2, bar_y2,
        f * 100,
        c_white, fill_color, fill_color, 0, true, true
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
    static burst_particles = function() {
        part_particles_create(Particles.system, self.x, self.y, Particles.type_boss_stage, 50);
    };
    var f = self.health / self.health_max;
    var last_stage = self.hp_stage;
    if (f < 0.25) {
        self.hp_stage = 3;
        self.hp = self.health_max / 4;
        if (last_stage != self.hp_stage) {
            self.OnHPStageChange();
            burst_particles();
        }
		GameController.level.AddScore(self.point_value / 4);
    } else if (f < 0.50) {
        self.hp_stage = 2;
        self.hp = self.health_max / 2;
        if (last_stage != self.hp_stage) {
            self.OnHPStageChange();
            burst_particles();
        }
		GameController.level.AddScore(self.point_value / 4);
    } else if (f < 0.75) {
        self.hp_stage = 1;
        self.hp = 3 * self.health_max / 4;
        if (last_stage != self.hp_stage) {
            self.OnHPStageChange();
            burst_particles();
        }
		GameController.level.AddScore(self.point_value / 4);
    } else {
        self.hp_stage = 0;
        if (last_stage != self.hp_stage) {
            self.OnHPStageChange();
            burst_particles();
        }
    }
};

self.inheritedDie = self.Die;

self.Die = function() {
    self.inheritedDie();
    with (Spawner) instance_destroy();
    with (EntFoeTemplate) instance_destroy();
}

self.OnHPStageChange = function() {
    self.interstage_cooldown = DEFAULT_BOSS_STAGE_COOLDOWN;
    GameController.level.SendNextWave();
};