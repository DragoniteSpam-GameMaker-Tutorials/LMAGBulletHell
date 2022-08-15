var next = self.next;

while (next != undefined) {
    instance_destroy(next);
    next = next.next;
}