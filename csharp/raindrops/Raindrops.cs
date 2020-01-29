using System;

public static class Raindrops
{
    public static string Convert(int number)
    {
        string sound = "";

        if (IsDivisible(number, 3))
            sound += "Pling";
        if (IsDivisible(number, 5))
            sound += "Plang";
        if (IsDivisible(number, 7))
            sound += "Plong";
        if (sound == "")
            sound += number.ToString();

        return sound;
    }

    private static bool IsDivisible(int x, int y)
    {
        return x % y == 0;
    }
}