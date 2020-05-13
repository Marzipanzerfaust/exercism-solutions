using System;
using System.Text.RegularExpressions;

public class PhoneNumber
{
    static Regex valid_nanp_re = new Regex(@"^1?([2-9]\d{2})([2-9]\d{2})(\d{4})$");

    public static string Clean(string phoneNumber)
    {
        phoneNumber = Regex.Replace(phoneNumber, @"\D", "");
        var match = valid_nanp_re.Match(phoneNumber);

        if (match.Success) {
            var groups = match.Groups;
            return String.Format("{0}{1}{2}", groups[1], groups[2], groups[3]);
        } else {
            throw new ArgumentException();
        }
    }
}
