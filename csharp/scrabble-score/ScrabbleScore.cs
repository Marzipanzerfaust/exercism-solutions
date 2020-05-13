using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Collections.Generic;

public static class ScrabbleScore
{
    static Dictionary<char, int> scores = new Dictionary<char, int> {
        {'A', 1},
        {'B', 3},
        {'C', 3},
        {'D', 2},
        {'E', 1},
        {'F', 4},
        {'G', 2},
        {'H', 4},
        {'I', 1},
        {'J', 8},
        {'K', 5},
        {'L', 1},
        {'M', 3},
        {'N', 1},
        {'O', 1},
        {'P', 3},
        {'Q', 10},
        {'R', 1},
        {'S', 1},
        {'T', 1},
        {'U', 1},
        {'V', 4},
        {'W', 4},
        {'X', 8},
        {'Y', 4},
        {'Z', 10}
    };

    public static int Score(string input)
    {
        var sanitized = Regex.Replace(input, @"[^\p{L}]", "").ToUpper();

        if (sanitized.Length == 0)
            return 0;

        return sanitized.Sum(letter => scores[letter]);
    }
}
