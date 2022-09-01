function is_playing() {
    return GameController.state == GameStates.PLAYING;
}

function is_paused() {
    return GameController.state == GameStates.PAUSED;
}

function load_level_meshes(folder, format) {
    var filename = file_find_first(folder + "*.vbuff", 0);
    var output = [];
    while (filename != "") {
        var vbuff = load_vbuff(folder + filename, self.format);
        array_push(output, vbuff);
        filename = file_find_next();
    }
    file_find_close();
    return output;
}

function load_foe_meshes(filename, format) {
    var output = [];
    var index = 0;
    while (file_exists(string_replace(filename, "*", string(index)))) {
        array_push(output, load_vbuff(string_replace(filename, "*", string(index)), format));
        index++;
    }
    return output;
}

function array_get_random_element(array) {
    return array[irandom(array_length(array) - 1)];
}

function load_vbuff(filename, format) {
    var buffer = buffer_load(filename);
    var vbuff = vertex_create_buffer_from_buffer(buffer, format);
    buffer_delete(buffer);
    vertex_freeze(vbuff);
    return vbuff;
}

function foe_count() {
    return instance_number(EntFoeTemplate) - instance_number(EntFoeCentipedeSegment);
};