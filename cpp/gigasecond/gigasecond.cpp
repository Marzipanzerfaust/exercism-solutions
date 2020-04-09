#include "gigasecond.h"
#include <cmath>

using namespace boost::posix_time;

ptime gigasecond::advance(const ptime& input) {
    return input + seconds((int) pow(10, 9));
}
