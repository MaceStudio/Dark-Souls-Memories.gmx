ini_open("config.ini");
/////////////////////////////////////////////////////////////////////////////////////
//Read
/////////////////////////////////////////////////////////////////////////////////////

//Keyboard / Mouse
global.input_up = input_real(ini_read_string("Keyboard / Mouse", "Up", "W"));
global.input_left = input_real(ini_read_string("Keyboard / Mouse", "Left", "A"));
global.input_down = input_real(ini_read_string("Keyboard / Mouse", "Down", "S"));
global.input_right = input_real(ini_read_string("Keyboard / Mouse", "Right", "D"));
global.input_jump = input_real(ini_read_string("Keyboard / Mouse", "Jump", "Space"));
global.input_use = input_real(ini_read_string("Keyboard / Mouse", "Use", "E"));
global.input_cancel = input_real(ini_read_string("Keyboard / Mouse", "Cancel", "X"));
global.input_pause = input_real(ini_read_string("Keyboard / Mouse", "Pause", "Escape"));

//Gamepad
global.gamepad_deadzone[0] = ini_read_real("Gamepad", "Deadzone", 0.10);
global.gamepad_sensitivity_x[0] = ini_read_real("Gamepad", "Look Sensitivity X", 10);
global.gamepad_sensitivity_y[0] = ini_read_real("Gamepad", "Look Sensitivity Y", 5);
global.gamepad_jump[0] = input_real(ini_read_string("Gamepad", "Jump Button", "Gamepad A"));
global.gamepad_use[0] = input_real(ini_read_string("Gamepad", "Use Button", "Gamepad A"));
global.gamepad_cancel[0] = input_real(ini_read_string("Gamepad", "Cancel Button", "Gamepad X"));
global.gamepad_pause[0] = input_real(ini_read_string("Gamepad", "Pause Button", "Gamepad Start"));
global.gamepad_move[0] = input_real(ini_read_string("Gamepad", "Move Axis", "Left Stick"));
global.gamepad_look[0] = input_real(ini_read_string("Gamepad", "Look Axis", "Right Stick"));

//Graphics
global.res_x = real(string_digits(ini_read_string("Graphics", "Resolution Width", string_digits(string(display_get_width())))));
global.res_y = real(string_digits(ini_read_string("Graphics", "Resolution Height", string_digits(string(display_get_height())))));
global.aspect_ratio = ini_read_real("Graphics", "Aspect Ratio", (global.res_x / global.res_y));

global.fullscreen = real(string_digits(ini_read_string("Graphics", "Fullscreen", "1")));
global.antialiasing = real(string_digits(ini_read_string("Graphics", "Anti-aliasing", "8")));
global.vsync = real(string_digits(ini_read_string("Graphics", "Vsync", "1")));
global.framelimit = real(string_digits(ini_read_string("Graphics", "Frame Limit", "60")));
global.gamma = ini_read_real("Graphics", "Gamma", 1.0);

//Sound
global.master_volume = ini_read_real("Sound", "Master Volume", 100);
global.bgm_volume = ini_read_real("Sound", "BGM Volume", 100);
global.sfx_volume = ini_read_real("Sound", "SFX Volume", 50);
global.dialogue_volume = ini_read_real("Sound", "Dialogue Volume", 100);

//Gameplay
global.captions = real(string_digits(ini_read_string("Gameplay", "Captions", "0")));
global.commentary = real(string_digits(ini_read_string("Gameplay", "Commentary", "0")));
global.difficulty = real(string_digits(ini_read_string("Gameplay", "Difficulty", "1")));
global.lastsave = ini_read_string("Gameplay", "LastSave", "");

/////////////////////////////////////////////////////////////////////////////////////
//Range
/////////////////////////////////////////////////////////////////////////////////////

global.mouse_viewmode = range_add(global.mouse_viewmode, 0, 1, 0);
global.fullscreen = range_add(global.fullscreen, 0, 1, 0);
global.antialiasing = clamp(floor(global.antialiasing / 2) * 2, 0, 8);
global.vsync = range_add(global.vsync, 0, 1, 0);
global.framelimit = range_add(global.framelimit, 10, 999, 0);
global.captions = range_add(global.captions, 0, 2, 0);
global.commentary = range_add(global.commentary, 0, 1, 0);
global.difficulty = range_add(global.difficulty, 0, 2, 0);

/////////////////////////////////////////////////////////////////////////////////////
//Write
/////////////////////////////////////////////////////////////////////////////////////

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
ini_write_string("Graphics", "Shaders", string(global.antialiasing));
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

config_apply();
