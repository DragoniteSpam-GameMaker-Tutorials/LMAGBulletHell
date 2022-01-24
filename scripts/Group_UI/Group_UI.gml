function UIManager() constructor {
    self.all_ui_elements = { };
    
    with (ParentUI) {
        var layers = other.all_ui_elements[$ string(self.depth)];
        if (layers == undefined) {
            layers = {
                elements: ds_list_create(),
                block_raycast: undefined,
                Render: function() {
                    self.block_raycast.Render();
                    for (var i = 0; i < ds_list_size(self.elements); i++) {
                        self.elements[| i].Render();
                    }
                },
            };
            other.all_ui_elements[$ string(self.depth)] = layers;
        }
        ds_list_add(layers.elements, self.id);
        self.visible = false;
    }
    
    with (UIBlockRaycast) {
        // raycast-blocking objects are only meaningful if
        // they're on a UI layer
        var layers = other.all_ui_elements[$ string(self.depth)];
        if (layers != undefined) {
            layers.block_raycast = self.id;
            self.visible = false;
        } else {
            instance_destroy();
        }
    }
    
    static GetUI = function(layer_name) {
        return self.all_ui_elements[$ layer_get_depth(layer_name)];
    };
    
    static RenderUI = function(layer_name) {
        self.GetUI(layer_name).Render();
    };
}