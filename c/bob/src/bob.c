#include "bob.h"
#include <string.h>
#include <ctype.h>

char* hey_bob(const char greeting[]) {
    if (is_speech(greeting)) {
        if (is_question(greeting) && is_shouting(greeting))
            return "Calm down, I know what I'm doing!";
        else if (is_question(greeting))
            return "Sure.";
        else if (is_shouting(greeting))
            return "Whoa, chill out!";
        else
            return "Whatever.";
    } else {
        return "Fine. Be that way!";
    }
}

bool is_speech(const char str[]) {
    for (size_t i = 0; str[i] != 0; ++i)
        if (isgraph(str[i]))
            return true;

    return false;
}

bool is_question(const char str[]) {
    for (size_t i = strlen(str) - 1; i > 0; --i) {
        if isgraph(str[i])
            return str[i] == '?';
    }

    return false;
}

bool is_shouting(const char str[]) {
    bool found_upper = false;

    for (size_t i = 0; str[i] != 0; ++i) {
        if (islower(str[i])) return false;
        if (isupper(str[i])) found_upper = true;
    }

    return found_upper;
}
