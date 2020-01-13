using System;
using System.Collections.Generic;
using System.Linq;

public class GradeSchool
{
    private Dictionary<string, int> roster;

    public GradeSchool() => roster = new Dictionary<string, int>();

    public void Add(string student, int grade)
    {
        roster.Add(student, grade);
    }

    public IEnumerable<string> Roster()
    {
        return
            from pair in roster
            orderby pair.Value, pair.Key
            select pair.Key;
    }

    public IEnumerable<string> Grade(int grade)
    {
        return
            from pair in roster
            where pair.Value == grade
            orderby pair.Key
            select pair.Key;
    }
}
