using System;
using System.Collections.Generic;

public static class Pangram
{
    public static bool IsPangram(string input)
    {
        var letters = new HashSet<char>("abcdefghijklmnopqrstuvwxyz");
        letters.ExceptWith(input.ToLower());

        return letters.Count == 0;
    }
}
