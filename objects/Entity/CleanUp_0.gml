
if (ds_exists(self.timers, ds_type_list)) {
    for (var i = 0, n = ds_list_size(self.timers); i < n; i++) {
        time_source_destroy(self.timers[| i]);
    }
    
    ds_list_destroy(self.timers);
}