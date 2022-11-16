event_inherited();

var next = self.next;

while (instance_exists(next)) {
    var pending_next = next.next;
    instance_destroy(next);
    next = pending_next;
}

if (time_source_exists(self.time_source_track_player)) {
	time_source_destroy(self.time_source_track_player);
}