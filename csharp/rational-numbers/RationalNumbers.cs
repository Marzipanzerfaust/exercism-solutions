using System;
using System.Diagnostics;

public static class Helpers
{
    public static int IntPow(int a, int b)
    {
        return (int)Math.Pow(a, b);
    }

    public static int GCD(int a, int b)
    {
        if (b == 0)
            return a;
        else
            return GCD(b, a % b);
    }
}

public static class RealNumberExtension
{
    public static double Expreal(this int realNumber, RationalNumber r)
    {
        return Math.Exp(Math.Log(realNumber) * r.Numerator / r.Denominator);
    }
}

public struct RationalNumber
{
    public int Numerator, Denominator;

    public RationalNumber(int numerator, int denominator)
    {
        Numerator = numerator;
        Denominator = denominator;

        Reduce();
    }

    public static RationalNumber operator +(RationalNumber r1, RationalNumber r2)
    {
        var a = r1.Numerator * r2.Denominator + r2.Numerator * r1.Denominator;
        var b = r1.Denominator * r2.Denominator;

        return new RationalNumber(a, b);
    }

    public static RationalNumber operator -(RationalNumber r1, RationalNumber r2)
    {
        var a = r1.Numerator * r2.Denominator - r2.Numerator * r1.Denominator;
        var b = r1.Denominator * r2.Denominator;

        return new RationalNumber(a, b);
    }

    public static RationalNumber operator *(RationalNumber r1, RationalNumber r2)
    {
        var a = r1.Numerator * r2.Numerator;
        var b = r1.Denominator * r2.Denominator;

        return new RationalNumber(a, b);
    }

    public static RationalNumber operator /(RationalNumber r1, RationalNumber r2)
    {
        var a = r1.Numerator * r2.Denominator;
        var b = r1.Denominator * r2.Numerator;

        return new RationalNumber(a, b);
    }

    public RationalNumber Abs()
    {
        return new RationalNumber(Math.Abs(Numerator), Denominator);
    }

    public RationalNumber Reduce()
    {
        var divisor = Helpers.GCD(Numerator, Denominator);

        Numerator /= divisor;
        Denominator /= divisor;

        if (Denominator < 0) {
            Numerator = -Numerator;
            Denominator = -Denominator;
        }

        return this;
    }

    public RationalNumber Exprational(int power)
    {
        return new RationalNumber(Helpers.IntPow(Numerator, power),
                                  Helpers.IntPow(Denominator, power));
    }

    public double Expreal(int baseNumber)
    {
        return Math.Pow(baseNumber, Numerator / Denominator);
    }
}
