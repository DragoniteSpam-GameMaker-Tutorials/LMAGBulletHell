for (var i = ds_list_size(self.timers) - 1; i >= 0; i--) {
    if (time_source_get_state(self.timers[| i]) == time_source_state_stopped) {
        time_source_destroy(self.timers[| i]);
        ds_list_delete(self.timers, i);
    }
}