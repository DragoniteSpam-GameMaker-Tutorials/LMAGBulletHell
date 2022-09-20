event_inherited();

var next = self.next;

while (instance_exists(next)) {
    instance_destroy(next);
    next = next.next;
}