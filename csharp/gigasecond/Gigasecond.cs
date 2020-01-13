using System;

public static class Gigasecond
{
    public static DateTime Add(DateTime moment)
    {
        return moment.Add(new TimeSpan(0, 0, (int)Math.Pow(10, 9)));
    }
}
