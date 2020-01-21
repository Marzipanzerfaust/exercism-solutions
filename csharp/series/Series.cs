using System;

public static class Series
{
    public static string[] Slices(string numbers, int sliceLength)
    {
        if (sliceLength > numbers.Length || sliceLength <= 0)
            throw new ArgumentException();

        var numberOfSlices = numbers.Length - sliceLength + 1;

        var output = new string[numberOfSlices];

        for (var i = 0; i < numberOfSlices; ++i)
            output[i] = numbers.Substring(i, sliceLength);

        return output;
    }
}
