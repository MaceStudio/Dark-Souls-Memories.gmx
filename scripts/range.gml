///range(var, min, max)
var v, mn, mx;
v = argument0;
mn = argument1;
mx = argument2;
if (mn < mx)
{
    v = v mod (mx - mn);
    while(v < mn)
    {
        v += (mx - mn);
    }
}

return v;