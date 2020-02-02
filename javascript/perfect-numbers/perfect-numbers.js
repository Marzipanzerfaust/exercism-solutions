export const classify = (n) => {
    if (n <= 0)
        throw "Classification is only possible for natural numbers.";

    let aliquot_sum = 0;
    let upper = parseInt(n / 2);

    for (let i = 1; i <= upper; ++i)
        if (n % i == 0)
            aliquot_sum += i;

    if (aliquot_sum > n)
        return "abundant";
    else if (aliquot_sum < n)
        return "deficient";
    else
        return "perfect";
};
