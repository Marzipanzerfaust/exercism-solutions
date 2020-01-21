using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

public class ForthStack
{
    private static Regex DEFINITION = new Regex(@": (?<name>\S+) (?<defn>[^;]+) ;");

    private Stack<int> stack;
    private Dictionary<string, string> definitions;

    public ForthStack() {
        stack = new Stack<int>();
        definitions = new Dictionary<string, string>();
    }

    public void Evaluate(string instruction) {
        // Expressions are case-insensitive
        var expr = instruction.ToLower();

        // If this instruction is a definition, parse its contents
        // into the definition list
        var m = DEFINITION.Match(expr);

        if (m.Success) {
            var name = m.Groups["name"].Value;
            var defn = m.Groups["defn"].Value;

            if (int.TryParse(name, out int tmp))
                // Can't redefine numbers
                throw new InvalidOperationException();

            // Replace all user-defined words in the definition with
            // their corresponding definitions before adding it to
            // the dictionary
            foreach (var term in defn.Split(' '))
                if (definitions.ContainsKey(term))
                    defn = defn.Replace(term, definitions[term]);

            definitions[name] = defn;

            return;
        }

        // Now, we can evaluate the instruction:
        foreach (var term in expr.Split(' ')) {
            if (int.TryParse(term, out int tmp))
                stack.Push(tmp);
            else if (definitions.ContainsKey(term))
                Evaluate(definitions[term]);
            else {
                switch (term) {
                case "dup": Duplicate(); break;
                case "drop": Drop(); break;
                case "swap": Swap(); break;
                case "over": Over(); break;
                case "+": Add(); break;
                case "-": Subtract(); break;
                case "*": Multiply(); break;
                case "/": Divide(); break;
                default: throw new InvalidOperationException();
                }
            }
        }
    }

    private void Duplicate() {
        stack.Push(stack.Peek());
    }

    private void Drop() {
        stack.Pop();
    }

    private void Swap() {
        var b = stack.Pop();
        var a = stack.Pop();

        stack.Push(b);
        stack.Push(a);
    }

    private void Over() {
        var b = stack.Pop();
        var a = stack.Pop();

        stack.Push(a);
        stack.Push(b);
        stack.Push(a);
    }

    private void Add() {
        var b = stack.Pop();
        var a = stack.Pop();

        stack.Push(a + b);
    }

    private void Subtract() {
        var b = stack.Pop();
        var a = stack.Pop();

        stack.Push(a - b);
    }

    private void Multiply() {
        var b = stack.Pop();
        var a = stack.Pop();

        stack.Push(a * b);
    }

    private void Divide() {
        var b = stack.Pop();
        var a = stack.Pop();

        if (b == 0)
            throw new InvalidOperationException();

        stack.Push(a / b);
    }

    override public string ToString() {
        var output = stack.ToArray();
        Array.Reverse(output);
        return string.Join(" ", output);
    }
}

public static class Forth
{
    public static string Evaluate(string[] instructions)
    {
        var stack = new ForthStack();

        foreach (var instruction in instructions)
            stack.Evaluate(instruction);

        return stack.ToString();
    }
}
