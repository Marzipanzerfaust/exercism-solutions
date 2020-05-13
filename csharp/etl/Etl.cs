using System;
using System.Collections.Generic;

public static class Etl
{
    public static Dictionary<string, int> Transform(Dictionary<int, string[]> old)
    {
        var output = new Dictionary<string, int>();

        foreach (var entry in old) {
            foreach(var val in entry.Value)
                output[val.ToLower()] = entry.Key;
        }

        return output;
    }
}
