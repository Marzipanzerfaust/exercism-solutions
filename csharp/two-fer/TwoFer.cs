using System;

public static class TwoFer
{
    public static string Name(string input = null)
    {
        if (input != null)
            return $"One for {input}, one for me.";
        else
            return "One for you, one for me.";
    }
}
