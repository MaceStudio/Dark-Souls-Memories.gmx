//input_str(char) - Returns string for any input var. (A-Z, 0-9, Arrows, Modifiers, Gamepad Buttons)
var c;
c = argument0;

if ((c > 64 && c < 91) || (c > 47 && c < 58))
{
    return chr(c);
}
if (c == -2)
{
    return "...";
}
//Mouse
if (c == mb_left)
{
    return "Left MB";
}
if (c == mb_right)
{
    return "Right MB";
}
if (c == mb_middle)
{
    return "Middle MB";
}
//Arrows
if (c == vk_up)
{
    return "Up";
}
if (c == vk_left)
{
    return "Left";
}
if (c == vk_down)
{
    return "Down";
}
if (c == vk_right)
{
    return "Right";
}
//Modifiers
if (c == vk_alt)
{
    return "Alt";
}
if (c == vk_shift)
{
    return "Shift";
}
if (c == vk_control)
{
    return "Ctrl";
}
if (c == vk_enter)
{
    return "Enter";
}
if (c == vk_escape)
{
    return "Escape";
}
if (c == vk_space)
{
    return "Space";
}
//Gamepad
if (c == gp_axislh)
{
    return "Left Stick";
}
if (c == gp_axislv)
{
    return "Left Stick Y";
}
if (c == gp_axisrh)
{
    return "Right Stick";
}
if (c == gp_axisrv)
{
    return "Right Stick Y";
}
if (c == gp_face1)
{
    return "Pad A";
}
if (c == gp_face2)
{
    return "Pad B";
}
if (c == gp_face3)
{
    return "Pad X";
}
if (c == gp_face4)
{
    return "Pad Y";
}
if (c == gp_start)
{
    return "Pad Start";
}
return "";