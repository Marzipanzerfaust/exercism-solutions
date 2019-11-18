#ifndef SPACE_AGE_H
#define SPACE_AGE_H

namespace space_age {
    const float earth_seconds = 31557600;
    const float mercury_seconds = earth_seconds * 0.2408467;
    const float venus_seconds = earth_seconds * 0.61519726;
    const float mars_seconds = earth_seconds * 1.8808158;
    const float jupiter_seconds = earth_seconds * 11.862615;
    const float saturn_seconds = earth_seconds * 29.447498;
    const float uranus_seconds = earth_seconds * 84.016846;
    const float neptune_seconds = earth_seconds * 164.79132;

    class space_age {
    public:
        space_age(long s) : inner_seconds(s) {};

        long seconds() const;
        float on_earth() const;
        float on_mercury() const;
        float on_venus() const;
        float on_mars() const;
        float on_jupiter() const;
        float on_saturn() const;
        float on_uranus() const;
        float on_neptune() const;
    private:
        long inner_seconds;
    };
}

#endif
