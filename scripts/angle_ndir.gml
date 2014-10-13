//angle_ndir(angle, n)
//makes an angle fall between n directions.
var angle, dir, angle_div;
angle = range(argument0, -180, 180);
dir = argument1;
angle_div = 360 / dir;
if (dir > 0)
{
    for (var a = 1; a <= dir; a++)
    {
        if (angle >= (a - .5) * angle_div && angle < (a + .5) * angle_div)
        {
            return angle_div * a;
        }
    }
}
return angle;