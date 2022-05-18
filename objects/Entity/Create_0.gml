self.buff_fire = {
    duration: 0,
    value: false,
    damage_cooldown: 0,
};

self.OnDamage = function(bullet) {
};

self.OnEntityContact = function(entity) {
};

self.CheckDeath = function() {
};

self.timers = ds_list_create();

self.SetTimer = function(duration, callback) {
    var source = time_source_create(time_source_game, duration, time_source_units_seconds, callback);
    time_source_start(source);
    ds_list_add(self.timers, source);
}