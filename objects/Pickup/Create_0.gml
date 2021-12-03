var velocity = 4;
var angle = random(360);

self.xspeed = velocity * dsin(angle);
self.yspeed = -velocity * dcos(angle);
self.drag = 0.99;

self.ApplyEffect = function(entity) {
    
};