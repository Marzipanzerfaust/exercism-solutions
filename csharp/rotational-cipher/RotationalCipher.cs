using System;

public static class RotationalCipher
{
    static string alphabet = "abcdefghijklmnopqrstuvwxyz";
    static string alphabetUpper = alphabet.ToUpper();

    public static string Rotate(string text, int shiftKey)
    {
        var output = text.ToCharArray();

        for (var i = 0; i < text.Length; ++i)
            output[i] = Encode(text[i], shiftKey);

        return String.Join(null, output);
    }

    static char Encode(char c, int n)
    {
        var idx = alphabet.IndexOf(c);

        if (idx > -1) {
            return alphabet[(idx + n) % alphabet.Length];
        } else {
            var idxUpper = alphabetUpper.IndexOf(c);

            if (idxUpper > -1)
                return alphabetUpper[(idxUpper + n) % alphabet.Length];
            else
                return c;
        }
    }
}
