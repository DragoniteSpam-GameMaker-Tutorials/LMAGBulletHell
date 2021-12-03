event_inherited();

self.ApplyEffect = function(entity) {
    entity.health = min(entity.health_max, ++entity.health);
};