class ReverseString {
    String reverse(String inputString) {
        var size = inputString.length();
        var output = new char[size];

        for (var i = 0; i < size; ++i)
            output[i] = inputString.charAt(size - i - 1);

        return new String(output);
    }
}
