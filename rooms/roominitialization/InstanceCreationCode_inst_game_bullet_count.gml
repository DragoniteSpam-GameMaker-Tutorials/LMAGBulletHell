GetText = function() {
    if (!GameController.level) return;
    var bullet_count = instance_number(Bullet);
    with (Bullet) {
        if (self.friendly) bullet_count--;
    }
    self.text = L("Bullets: %0", bullet_count);
};