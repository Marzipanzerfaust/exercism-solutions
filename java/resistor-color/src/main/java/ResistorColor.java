import java.util.Arrays;
import java.util.ArrayList;

class ResistorColor {
    static ArrayList<String> colors = new ArrayList<String>(Arrays.asList(
        "black", "brown", "red", "orange", "yellow",
        "green", "blue", "violet", "grey", "white"
    ));

    int colorCode(String color) {
        return colors.indexOf(color);
    }

    String[] colors() {
        return colors.toArray(new String[colors.size()]);
    }
}
