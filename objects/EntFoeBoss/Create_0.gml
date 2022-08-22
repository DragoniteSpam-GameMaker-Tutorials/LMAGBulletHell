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