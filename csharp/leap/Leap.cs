using System;

public static class Leap
{
    public static bool IsLeapYear(int year)
    {
        return IsDivisible(year, 4) && !IsDivisible(year, 100) || IsDivisible(year, 400);
    }

    private static bool IsDivisible(int x, int y)
    {
        return x % y == 0;
    }
}
