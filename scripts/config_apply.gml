window_set_rectangle(0, 0, global.res_x, global.res_y);

for (i = 0; i < 3; i += 1)
{
    view_wview[i] = global.res_x;
    view_hview[i] = global.res_y;
    view_wport[i] = global.res_x;
    view_hport[i] = global.res_y;
}

display_reset(global.antialiasing, global.vsync);
window_set_fullscreen(global.fullscreen);
window_center();

room_speed = global.framelimit;
gamepad_detect();