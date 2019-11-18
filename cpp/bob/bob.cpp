#include "bob.h"

std::string bob::hey(std::string input) {
    std::string output;

    bool is_question;
    bool is_yell;

    // First, remove all characters that are not letters, numbers, or
    // question marks
    std::regex invalid("[^[:alnum:]?]");
    input = std::regex_replace(input, invalid, "");

    // Is the input a question?
    is_question = input.back() == '?';

    // Is the input a yell?
    std::regex lower("[a-z]");
    std::regex upper("[A-Z]");
    is_yell = std::regex_search(input, upper) && !std::regex_search(input, lower);

    if (is_question && is_yell)
        output = "Calm down, I know what I'm doing!";
    else if (is_question)
        output = "Sure.";
    else if (is_yell)
        output = "Whoa, chill out!";
    else if (input.empty())
        output = "Fine. Be that way!";
    else
        output = "Whatever.";

    return output;
}
