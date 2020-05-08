using System;

public class Clock
{
    int Hours, Minutes;

    public Clock(int hours, int minutes)
    {
        Hours = hours;
        Minutes = minutes;

        Wrap();
    }

    void Wrap()
    {
        while (Minutes >= 60) {
            Minutes -= 60;
            Hours += 1;
        }

        while (Minutes < 0) {
            Minutes += 60;
            Hours -= 1;
        }

        if (Hours >= 24)
            Hours %= 24;

        while (Hours < 0)
            Hours += 24;
    }

    public Clock Add(int minutesToAdd)
    {
        return new Clock(Hours, Minutes + minutesToAdd);
    }

    public Clock Subtract(int minutesToSubtract)
    {
        return Add(-minutesToSubtract);
    }

    public override string ToString()
    {
        var hh = Hours.ToString().PadLeft(2, '0');
        var mm = Minutes.ToString().PadLeft(2, '0');

        return hh + ':' + mm;
    }
}
