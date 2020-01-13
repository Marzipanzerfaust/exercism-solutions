using System;
using System.Collections.Generic;

public static class NucleotideCount
{
    public static IDictionary<char, int> Count(string sequence)
    {
        var counter = new Dictionary<char, int> {
            ['A'] = 0,
            ['C'] = 0,
            ['G'] = 0,
            ['T'] = 0
        };

        foreach (char c in sequence) {
            if (!counter.ContainsKey(c))
                throw new ArgumentException();

            ++counter[c];
        }

        return counter;
    }
}
