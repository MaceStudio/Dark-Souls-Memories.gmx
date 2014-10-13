ini_open("Config.ini");

//Keyboard / Mouse
ini_write_real("Keyboard / Mouse", "Mouse Sensitivity X", global.mouse_sensitivity_x);
ini_write_real("Keyboard / Mouse", "Mouse Sensitivity Y", global.mouse_sensitivity_y);
ini_write_string("Keyboard / Mouse", "Mouse Viewmode", string(global.mouse_viewmode));
ini_write_string("Keyboard / Mouse", "Up", input_str(global.input_up));
ini_write_string("Keyboard / Mouse", "Left", input_str(global.input_left));
ini_write_string("Keyboard / Mouse", "Down", input_str(global.input_down));
ini_write_string("Keyboard / Mouse", "Right", input_str(global.input_right));
ini_write_string("Keyboard / Mouse", "Jump", input_str(global.input_jump));
ini_write_string("Keyboard / Mouse", "Use", input_str(global.input_use));
ini_write_string("Keyboard / Mouse", "Cancel", input_str(global.input_cancel));
ini_write_string("Keyboard / Mouse", "Pause", input_str(global.input_pause));
ini_write_string("Keyboard / Mouse", "Rotate Camera", input_str(global.input_rotate));

//Gamepad
ini_write_real("Gamepad", "Deadzone", global.gamepad_deadzone[0]);
ini_write_real("Gamepad", "Look Sensitivity X", global.gamepad_sensitivity_x[0]);
ini_write_real("Gamepad", "Look Sensitivity Y", global.gamepad_sensitivity_y[0]);
ini_write_string("Gamepad", "Jump Button", input_str(global.gamepad_jump[0]));
ini_write_string("Gamepad", "Use Button", input_str(global.gamepad_use[0]));
ini_write_string("Gamepad", "Cancel Button", input_str(global.gamepad_cancel[0]));
ini_write_string("Gamepad", "Pause Button", input_str(global.gamepad_pause[0]));
ini_write_string("Gamepad", "Move Axis", input_str(global.gamepad_move[0]));
ini_write_string("Gamepad", "Look Axis", input_str(global.gamepad_look[0]));

//Graphics
ini_write_string("Graphics", "Resolution Width", string(global.res_x));
ini_write_string("Graphics", "Resolution Height", string(global.res_y));
ini_write_real("Graphics", "Aspect Ratio", global.aspect_ratio);

ini_write_string("Graphics", "Fullscreen", string(global.fullscreen));
ini_write_string("Graphics", "Anti-aliasing", string(global.antialiasing));
ini_write_string("Graphics", "Vsync", string(global.vsync));
ini_write_string("Graphics", "Frame Limit", string(global.framelimit));
ini_write_real("Graphics", "Gamma", global.gamma);

//Sound
ini_write_real("Sound", "Master Volume", global.master_volume)
ini_write_real("Sound", "BGM Volume", global.bgm_volume)
ini_write_real("Sound", "SFX Volume", global.sfx_volume)
ini_write_real("Sound", "Dialogue Volume", global.dialogue_volume)

//Gameplay
ini_write_string("Gameplay", "Captions", string(global.captions));
ini_write_string("Gameplay", "Commentary", string(global.commentary));
ini_write_string("Gameplay", "Difficulty", string(global.difficulty));
ini_write_string("Gameplay", "LastSave", global.lastsave);

ini_close();