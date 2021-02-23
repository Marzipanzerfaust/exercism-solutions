import java.time.LocalDate;
import java.time.LocalDateTime;

public class Gigasecond {
    private LocalDateTime dateTime;

    public Gigasecond(LocalDate moment) {
        dateTime = moment.atStartOfDay().plusSeconds(1_000_000_000);
    }

    public Gigasecond(LocalDateTime moment) {
        dateTime = moment.plusSeconds(1_000_000_000);
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }
}
