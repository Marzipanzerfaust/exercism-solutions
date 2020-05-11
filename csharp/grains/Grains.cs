using System;

public static class Grains
{
    public static ulong Square(int n)
    {
        if (n <= 0 || n > 64)
            throw new ArgumentOutOfRangeException();

        return (ulong)Math.Pow(2, n - 1);
    }

    public static ulong Total()
    {
        // The answer is 2^64 - 1, which is the highest value that can
        // be stored in a ulong/UInt64.
        return UInt64.MaxValue;
    }
}
