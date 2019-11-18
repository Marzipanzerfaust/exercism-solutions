using System;
using System.Collections.Generic;
using System.Linq;

public static class SumOfMultiples
{
    public static int Sum(IEnumerable<int> multiples, int max)
    {
        IEnumerable<int> allMultiples =
            from i in Enumerable.Range(1, max-1)
            where multiples.Any(x => i % x == 0)
            select i;

        return allMultiples.Sum();
    }
}
