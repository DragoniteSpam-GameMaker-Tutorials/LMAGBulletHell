if (self.id == other.id.ignore) return;
other.id.ApplyEffect(self);
self.OnDamage(other.id);