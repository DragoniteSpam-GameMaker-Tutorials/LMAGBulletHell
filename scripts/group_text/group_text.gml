function L(text, args = undefined) {
    // Your score is %0, and your health is %1
    
    text = text;
    
    if (args != undefined) {
        if (!is_array(args)) args = [args];
        for (var i = 0, n = array_length(args); i < n; i++) {
            text = string_replace_all(text, "%" + string(i), string(args[i]));
        }
    }
    
    return text;
}