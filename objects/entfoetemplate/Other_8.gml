self.active = true;

if (path_exists(self.path_loop)) {
    path_start(self.path_loop, 10, path_action_restart, false);
}