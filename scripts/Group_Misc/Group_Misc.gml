function is_playing() {
    return GameController.state == GameStates.PLAYING;
}

function is_paused() {
    return GameController.state == GameStates.PAUSED;
}

function load_level_meshes(folder, format) {
    var filename = file_find_first(folder + "*.vbuff", 0);
    var output = { };
    while (filename != "") {
        var buffer = buffer_load(folder + filename);
        var vbuff = vertex_create_buffer_from_buffer(buffer, self.format);
        output[$ filename] = vbuff;
        buffer_delete(buffer);
        filename = file_find_next();
    }
    file_find_close();
    return output;
}