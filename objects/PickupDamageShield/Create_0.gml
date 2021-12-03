event_inherited();

self.ApplyEffect = function(entity) {
    entity.buff_damage_shield.value = true;
    entity.buff_damage_shield.duration = 10;
};