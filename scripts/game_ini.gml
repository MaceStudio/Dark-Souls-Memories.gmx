///game_ini()
window_set_caption("Dark Souls Memories");

//Gamepad
global.gamepad_support = gamepad_is_supported();
for (var i = 0; i < 4; i++)
{
    global.gamepad_connected[i] = gamepad_is_connected(i);
}

config_load();
