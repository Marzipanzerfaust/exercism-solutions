using System;
using System.Linq;

public enum Classification
{
    Perfect,
    Abundant,
    Deficient
}

public static class PerfectNumbers
{
    public static Classification Classify(int number)
    {
        if (number <= 0)
            throw new ArgumentOutOfRangeException();

        var sum = AliquotSum(number);

        if (sum < number)
            return Classification.Deficient;
        else if (sum > number)
            return Classification.Abundant;
        else
            return Classification.Perfect;
    }

    private static int AliquotSum(int number)
    {
        return Enumerable.Range(1, number / 2)
            .Where(i => number % i == 0)
            .Sum();
    }
}
