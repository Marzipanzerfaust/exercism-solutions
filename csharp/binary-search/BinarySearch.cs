using System;

public static class BinarySearch
{
    public static int Find(int[] input, int value)
    {
        if (input.Length == 0)
            return -1;

        if (input.Length == 1) {
            if (input[0] == value)
                return 0;
            else
                return -1;
        }

        var middle = input.Length / 2;

        if (input[middle] < value) {
            var found = Find(input[middle..], value);

            if (found > -1)
                found += middle;

            return found;
        } else if (input[middle] > value) {
            return Find(input[..middle], value);
        } else {
            return middle;
        }
    }
}
