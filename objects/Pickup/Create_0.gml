var velocity = 240;
var angle = random(360);

self.lifespan = 10;

self.xspeed = velocity * dsin(angle);
self.yspeed = -velocity * dcos(angle);
self.drag = 0.99;

self.ApplyEffect = function(entity) {
    
};