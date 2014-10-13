//range_add(var, min, max, add)
//Increments a var by add between a range and loops between range.
var v, mn, mx, add;
add = argument[3];
mx = argument[2];
mn = argument[1];
v = argument[0];

v = clamp(v + add, mn - 1, mx + 1)
if (v < mn)
{
    return mx;
}
if (v > mx)
{
    return mn;
}

return v;