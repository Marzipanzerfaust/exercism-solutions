export const find = (array, n) => {
    if (array.length == 0)
        throw "Value not in array";

    if (array.length == 1 && array[0] != n)
        throw "Value not in array";

    let middle = parseInt(array.length / 2);

    if (array[middle] < n)
        return middle + find(array.slice(middle + 1), n) + 1;
    else if (array[middle] > n)
        return find(array.slice(0, middle), n)
    else
        return middle;
};
