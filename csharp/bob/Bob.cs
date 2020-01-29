using System;
using System.Text.RegularExpressions;

public static class Bob
{
    public static string Response(string statement)
    {
        statement = statement.Trim();
        char[] chars = statement.ToCharArray();
        Regex whitespace = new Regex(@"^\s+$");

        if (statement.Length == 0 || whitespace.Match(statement).Success)
        {
            return "Fine. Be that way!";
        }
        else if (Array.Exists(chars, x => Char.IsLetter(x)) && Array.TrueForAll(chars, x => IsUppercaseChar(x)))
        {
            return "Whoa, chill out!";
        }
        else if (statement[statement.Length-1] == '?')
        {
            return "Sure.";
        }
        else
        {
            return "Whatever.";
        }
    }

    private static bool IsUppercaseChar(char x)
    {
        // Check if the character is uppercase, unless it's not a letter
        if (Char.IsLetter(x))
        {
            return x == Char.ToUpper(x);
        }
        else
        {
            return true;
        }
    }
}