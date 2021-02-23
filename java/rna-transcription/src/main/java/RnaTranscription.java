import java.util.Map;

class RnaTranscription {
    static Map<Character, Character> dna2rna = Map.of(
        'G', 'C',
        'C', 'G',
        'T', 'A',
        'A', 'U'
    );

    String transcribe(String dnaStrand) {
        var rnaNucleotides = new char[dnaStrand.length()];

        for (var i = 0; i < dnaStrand.length(); ++i)
            rnaNucleotides[i] = dna2rna.get(dnaStrand.charAt(i));

        return new String(rnaNucleotides);
    }
}
