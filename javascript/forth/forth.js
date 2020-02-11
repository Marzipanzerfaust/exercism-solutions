const DEFINITION = /: (?<name>\S+) (?<defn>[^;]+) ;/;

export class Forth {
  constructor() {
    this.stack = [];
    this.definitions = new Map;
  }

  evaluate(expr) {
    // Expressions are case-insensitive
    expr = expr.toLowerCase();

    // If this expression is a definition, add it to the dictionary of
    // user definitions
    if (DEFINITION.test(expr)) {
      let m = expr.match(DEFINITION);

      if (isNumeric(m.groups.name))
        throw "Invalid definition";

      this.definitions.set(m.groups.name, m.groups.defn);

      return;
    }

    // Now, we can evaluate the expression:
    for (const term of expr.split(/\s+/)) {
      if (isNumeric(term)) {
        this.stack.push(parseInt(term));
        continue;
      }

      if (this.definitions.has(term)) {
        this.evaluate(this.definitions.get(term));
        continue;
      }

      if (term == "dup") {
        if (this.stack.length == 0)
          throw "Stack empty";

        this.stack.push(this.stack[this.stack.length - 1]);
      } else if (term == "drop") {
        if (this.stack.length == 0)
          throw "Stack empty";

        this.stack.pop();
      } else if (/[+\-*\/]/.test(term) || term == "swap" || term == "over") {
        if (this.stack.length < 2)
          throw "Stack empty";

        let b = this.stack.pop();
        let a = this.stack.pop();

        switch (term) {
        case "+":
          this.stack.push(a + b);
          break;
        case "-":
          this.stack.push(a - b);
          break;
        case "*":
          this.stack.push(a * b);
          break;
        case "/":
          if (b == 0)
            throw "Division by zero";

          this.stack.push(parseInt(a / b));
          break;
        case "swap":
          this.stack.push(b);
          this.stack.push(a);
          break;
        case "over":
          this.stack.push(a);
          this.stack.push(b);
          this.stack.push(a);
          break;
        }
      } else {
        throw "Unknown command";
      }
    }
  }
}

// Yields a match array for each occurrence of the given pattern in the
// string
String.prototype.scan = function*(pattern) {
  let match = this.match(pattern);

  if (!match)
    return null;

  yield match;

  let rest = this.slice(match[0].length);

  if (rest)
    yield* rest.scan(pattern);
}

function isNumeric(n) {
  let int = parseInt(n);
  return int == int;
}
