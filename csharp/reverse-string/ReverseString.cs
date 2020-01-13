using System;

public static class ReverseString
{
    public static string Reverse(string input)
    {
        var output = new char[input.Length];

        for (var i = 0; i < input.Length; ++i)
            output[output.Length - 1 - i] = input[i];

        return String.Join("", output);
    }
}
