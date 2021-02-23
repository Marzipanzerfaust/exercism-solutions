import java.lang.Math;

class Darts {
    private double _x, _y;

    Darts(double x, double y) {
        _x = x;
        _y = y;
    }

    int score() {
        var distance = Math.sqrt(_x * _x + _y * _y);

        if (distance > 10)
            return 0;
        else if (distance > 5)
            return 1;
        else if (distance > 1)
            return 5;
        else
            return 10;
    }
}
