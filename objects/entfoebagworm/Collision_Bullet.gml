if (self.id == other.id.ignore) return;
self.OnDamage(other.id);
other.id.ApplyEffect(self);