class ArmstrongNumbers {
    boolean isArmstrongNumber(int numberToCheck) {
        var str = Integer.toString(numberToCheck);
        var size = str.length();
        var sum = 0;

        for (char c : str.toCharArray())
            sum += Math.pow(c - '0', size);

        return sum == numberToCheck;
    }
}
