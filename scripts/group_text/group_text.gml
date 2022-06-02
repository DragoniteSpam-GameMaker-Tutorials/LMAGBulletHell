function L(text, args = undefined) {
    // example: "Your score is %0, and your health is %1"
    
    if (variable_struct_exists(Text[Settings.language_index], text)) {
        var translation = Text[Settings.language_index][$ text];
        if (translation != undefined) {
            text = translation;
        }
    } else {
        show_debug_message("Translated string not found: " + text);
        Text[Settings.language_index][$ text] = undefined;
    }
    
    if (args != undefined) {
        if (!is_array(args)) args = [args];
        for (var i = 0, n = array_length(args); i < n; i++) {
            text = string_replace_all(text, "%" + string(i), string(args[i]));
        }
    }
    
    return text;
}