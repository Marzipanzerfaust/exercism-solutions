#include "gigasecond.h"

using namespace boost::posix_time;

ptime gigasecond::advance(ptime input) {
    int x = pow(10, 9);
    return input + seconds(x);
}
