event_inherited();

self.ApplyEffect = function(entity) {
    entity.buff_recursive.value = true;
    entity.buff_recursive.duration = 10;
};