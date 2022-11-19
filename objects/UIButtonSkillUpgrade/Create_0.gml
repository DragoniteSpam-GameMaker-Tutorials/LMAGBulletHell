event_inherited();

OnClick = function() {
    switch (Upgrades[$ self.property]) {
        case 0:
            GameController.active_save_data.currency--;
            Upgrades[$ self.property]++;
			GameController.SaveAll();
            break;
        case 1:
            GameController.active_save_data.currency -= 2;
            Upgrades[$ self.property]++;
			GameController.SaveAll();
            break;
        case 2:
            GameController.active_save_data.currency -= 3;
            Upgrades[$ self.property]++;
			GameController.SaveAll();
            break;
    }
};

Update = function() {
    self.text = L(self.source_text);
    self.enabled = true;
    
    switch (Upgrades[$ self.property]) {
        case 0:
            if (GameController.active_save_data.currency < 1)
                self.enabled = false;
            break;
        case 1:
            if (GameController.active_save_data.currency < 2)
                self.enabled = false;
            break;
        case 2:
            if (GameController.active_save_data.currency < 3)
                self.enabled = false;
            break;
        case 3:
            self.enabled = false;
            break;
    }
};