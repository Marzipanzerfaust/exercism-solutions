using System;
using System.Collections.Generic;
using System.Linq;

public class Robot
{
    // Needed to shuffle the list of names below
    private static Random rng = new Random();

    // Create shuffled list of names (AA000..ZZ999)
    private static IEnumerable<string> names =
        from str in
            from i in Enumerable.Range('A', 26)
            from j in Enumerable.Range('A', 26)
            select $"{(char)i}{(char)j}"
        from num in Enumerable.Range(0, 1000)
        orderby rng.Next()
        select $"{str}{num.ToString().PadLeft(3, '0')}";

    // Yield names from the above list
    private static IEnumerable<string> GetNames()
    {
        foreach (var name in names)
            yield return name;
    }

    private static IEnumerator<string> nameEnum = GetNames().GetEnumerator();

    private string name;

    public Robot() => Reset();

    public string Name { get { return name; } }

    public void Reset()
    {
        nameEnum.MoveNext();
        name = nameEnum.Current;
    }
}
