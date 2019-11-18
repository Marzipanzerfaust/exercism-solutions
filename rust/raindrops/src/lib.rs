pub fn raindrops(n: u32) -> String {
    let output = "".to_string();

    if is_divisible(n, 3)
    {
        output += "Pling";
    }
    if is_divisible(n, 5)
    {
        output += "Plang";
    }
    if is_divisible(n, 7)
    {
        output += "Plong";
    }

    return output;
}

fn is_divisible(a: u32, b: u32) -> bool {
    a % b == 0
}
