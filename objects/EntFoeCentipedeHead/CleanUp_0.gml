event_inherited();

var next = self.next;

while (instance_exists(next)) {
    var pending_next = next.next;
    instance_destroy(next);
    next = pending_next;
}