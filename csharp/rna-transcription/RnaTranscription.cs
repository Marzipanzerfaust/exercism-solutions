using System;
using System.Linq;
using System.Collections.Generic;

public static class RnaTranscription
{
    static Dictionary<char, char> dna_to_rna = new Dictionary<char, char> {
        {'G', 'C'},
        {'C', 'G'},
        {'T', 'A'},
        {'A', 'U'}
    };

    public static string ToRna(string nucleotide)
    {
        return String.Join(null, nucleotide.Select(c => dna_to_rna[c]));
    }
}
