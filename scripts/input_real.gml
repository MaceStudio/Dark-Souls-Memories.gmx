//input_str(char) - Returns real for any input var. (A-Z, 0-9, Arrows, Modifiers, Pad Buttons)
var c;
c = argument0;

if (string_length(c) == 1)
{
    return ord(string_upper(c));
}
//Mouse
if (c == "Left MB")
{
    return mb_left;
}
if (c == "Right MB")
{
    return mb_right;
}
if (c == "Middle MB")
{
    return mb_middle;
}
//Arrows
if (c == "Up")
{
    return vk_up;
}
if (c == "Left")
{
    return vk_left;
}
if (c == "Down")
{
    return vk_down;
}
if (c == "Right")
{
    return vk_right;
}
//Modifiers
if (c == "Alt")
{
    return vk_alt;
}
if (c == "Shift")
{
    return vk_shift;
}
if (c == "Ctrl")
{
    return vk_control;
}
if (c == "Enter")
{
    return vk_enter;
}
if (c == "Escape")
{
    return vk_escape;
}
if (c == "Space")
{
    return vk_space;
}
//Pad
if (c == "Left Stick")
{
    return gp_axislh;
}
if (c == "Left Stick Y")
{
    return gp_axislv;
}
if (c == "Right Stick")
{
    return gp_axisrh;
}
if (c == "Right Stick Y")
{
    return gp_axisrv;
}
if (c == "Pad A")
{
    return gp_face1;
}
if (c == "Pad B")
{
    return gp_face2;
}
if (c == "Pad X")
{
    return gp_face3;
}
if (c == "Pad Y")
{
    return gp_face4;
}
if (c == "Pad Start")
{
    return gp_start;
}
return vk_space;