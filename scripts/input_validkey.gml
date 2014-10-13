//input_str(char) - Returns true for any input var. (A-Z, 0-9, Arrows, Modifiers)
var c;
c = argument0;

if ((c > 64 && c < 91) || (c > 47 && c < 58))
{
    return true;
}
//Arrows
if (c == vk_up)
{
    return true;
}
if (c == vk_left)
{
    return true;
}
if (c == vk_down)
{
    return true;
}
if (c == vk_right)
{
    return true;
}
//Modifiers
if (c == vk_alt)
{
    return true;
}
if (c == vk_shift)
{
    return true;
}
if (c == vk_control)
{
    return true;
}
if (c == vk_enter)
{
    return true;
}
if (c == vk_escape)
{
    return true;
}
if (c == vk_space)
{
    return true;
}

return false;