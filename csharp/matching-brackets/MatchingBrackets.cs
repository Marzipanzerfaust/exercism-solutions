using System;
using System.Collections.Generic;

public static class MatchingBrackets
{
    private static Dictionary<char, char> pairs = new Dictionary<char, char>() {
        {'(', ')'},
        {'[', ']'},
        {'{', '}'}
    };

    public static bool IsPaired(string input)
    {
        var s = new Stack<char>();

        foreach (var c in input) {
            if (c == '(' || c == '[' || c == '{') {
                s.Push(c);
            } else if (c == ')' || c == ']' || c == '}') {
                if (s.Count == 0)
                    return false;

                if (pairs[s.Pop()] != c)
                    return false;
            }
        }

        return s.Count == 0;
    }
}
