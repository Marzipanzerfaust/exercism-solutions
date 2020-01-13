using System;
using System.Linq;

[Flags]
public enum Allergen
{
    Eggs = 1,
    Peanuts = 2,
    Shellfish = 4,
    Strawberries = 8,
    Tomatoes = 16,
    Chocolate = 32,
    Pollen = 64,
    Cats = 128
}

public class Allergies
{
    private Allergen score;

    public Allergies(int mask)
    {
        score = (Allergen)mask;
    }

    public bool IsAllergicTo(Allergen allergen)
    {
        return score.HasFlag(allergen);
    }

    public Allergen[] List()
    {
        return Enum.GetValues(typeof(Allergen)).Cast<Allergen>()
            .Where(v => IsAllergicTo(v))
            .ToArray();
    }
}
