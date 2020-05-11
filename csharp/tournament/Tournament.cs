using System;
using System.IO;
using System.Collections.Generic;

public static class Tournament
{
    public static void Tally(Stream inStream, Stream outStream)
    {
        var reader = new StreamReader(inStream);
        var input = reader.ReadToEnd();

        var teams = new HashSet<string>();

        var played = new Dictionary<string, int>();
        var won = new Dictionary<string, int>();
        var drawn = new Dictionary<string, int>();
        var lost = new Dictionary<string, int>();
        var points = new Dictionary<string, int>();

        var lines = input.Split('\n');

        foreach (var line in lines) {
            // var (a, b, result) = line.Split(';');
            var tokens = line.Split(';');
            var a = tokens[0];
            var b = tokens[1];
            var result = tokens[2];

            teams.Add(a);
            teams.Add(b);

            played[a] += 1;
            played[b] += 1;

            switch (result) {
            case "win":
                won[a] += 1;
                lost[b] += 1;
                points[a] += 3;
                break;
            case "lose":
                lost[a] += 1;
                won[b] += 1;
                points[b] += 3;
                break;
            case "draw":
                drawn[a] += 1;
                drawn[b] += 1;
                points[a] += 1;
                points[b] += 1;
                break;
            }
        }

        var sorted = new string[teams.Count];
        teams.CopyTo(sorted);

        sorted.Sort((a, b) => {
            if (points[b] == points[a])
                return a.CompareTo(b);
            else
                return points[b].CompareTo(points[a]);
        });

        // var output = "Team                           | MP |  W |  D |  L |  P";

        var writer = StreamWriter(outStream);

        writer.WriteLine("Team                           | MP |  W |  D |  L |  P");

        foreach (var team in sorted) {
            writer.WriteLine("{0,-30} | {1,2} | {2,2} | {3,2} | {4,2} | {5,2}".Format(
                team, played[team], won[team], drawn[team], lost[team], points[team]
            ));
        }
    }
}
