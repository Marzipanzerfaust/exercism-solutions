export const findAnagrams = (str, matches) => {
    return matches.slice().filter(s => s.isAnagramOf(str));
}

String.prototype.isAnagramOf = function(other) {
    let thisLower = this.toLowerCase();
    let otherLower = other.toLowerCase();

    if (thisLower == otherLower)
        return false;
    else
        return [...thisLower].sort().join("") == [...otherLower].sort().join("")
}
