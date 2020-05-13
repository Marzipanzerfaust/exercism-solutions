using System;
using System.Collections.Generic;

public static class ExtensionMethods
{
    public static IEnumerable<string> EachSlice(this string s, int n)
    {
        for (var i = 0; i < s.Length; i += n)
            yield return s.Substring(i, n);
    }
}

public static class ProteinTranslation
{
    static Dictionary<string, string> codon_to_protein = new Dictionary<string, string> {
        {"AUG", "Methionine"},
        {"UUU", "Phenylalanine"},
        {"UUC", "Phenylalanine"},
        {"UUA", "Leucine"},
        {"UUG", "Leucine"},
        {"UCU", "Serine"},
        {"UCC", "Serine"},
        {"UCA", "Serine"},
        {"UCG", "Serine"},
        {"UAU", "Tyrosine"},
        {"UAC", "Tyrosine"},
        {"UGU", "Cysteine"},
        {"UGC", "Cysteine"},
        {"UGG", "Tryptophan"},
        {"UAA", "STOP"},
        {"UAG", "STOP"},
        {"UGA", "STOP"}
    };

    public static string[] Proteins(string strand)
    {
        var polypeptide = new List<string>();

        foreach (var c in strand.EachSlice(3)) {
            var protein = codon_to_protein[c];

            if (protein == "STOP")
                break;

            polypeptide.Add(protein);
        }

        return polypeptide.ToArray();
    }
}
