///timer_tick(slot)
//Returns true if the alarm is ready to perform an event.
var t = timer[argument0], t2 = t != -65536;
if (t2)
{
    timer[argument0]--;
    if (t <= 0)
    {
        timer[argument0]= -65536;
        return (true)
    }
}
return (false)
