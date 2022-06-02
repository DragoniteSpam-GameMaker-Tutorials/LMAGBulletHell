function L(text, args = undefined) {
    if (text == "") return "";
    // example: "Your score is %0, and your health is %1"
    
    if (variable_struct_exists(Text[Settings.language_index], text) && Text[Settings.language_index][$ text] != "") {
        var translation = Text[Settings.language_index][$ text];
        if (translation != undefined) {
            text = translation;
        }
    } else {
        if (Settings.language_index == 0) {
            Text[Settings.language_index][$ text] = text;
        } else {
            show_debug_message("Translated string not found: " + text);
            Text[Settings.language_index][$ text] = undefined;
            if (SAVE_ON_MISSING_TEXT) save_text_csv(TEXT_FILE);
        }
    }
    
    if (args != undefined) {
        if (!is_array(args)) args = [args];
        for (var i = 0, n = array_length(args); i < n; i++) {
            text = string_replace_all(text, "%" + string(i), string(args[i]));
        }
    }
    
    return text;
}

function save_text_csv(filename) {
    static output = buffer_create(1000, buffer_grow, 1);
    buffer_seek(output, buffer_seek_start, 0);
    
    var keys = variable_struct_get_names(Text[0]);
    array_sort(keys, true);
    
    for (var i = 0, h = array_length(keys); i < h; i++) {
        for (var j = 0, w = array_length(Text); j < w; j++) {
            var translation = Text[j][$ keys[i]];
            buffer_write(output, buffer_text, ((translation != undefined) ? string_replace_all(translation, "\n", "\\n") : "") + ",");
        }
        buffer_write(output, buffer_text, "\r\n");
    }
    
    buffer_save_ext(output, filename, 0, buffer_tell(output));
}