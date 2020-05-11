using System;
using System.Linq;
using System.Collections.Generic;

public static class ArmstrongNumbers
{
    public static bool IsArmstrongNumber(int number)
    {
        var str = number.ToString();
        return number == Enumerable.Sum(str.ToCharArray(),
                                        c => Math.Pow(c - '0', str.Length));
    }
}
