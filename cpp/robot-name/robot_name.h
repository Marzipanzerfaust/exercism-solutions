#ifndef ROBOT_NAME_H
#define ROBOT_NAME_H

namespace robot_name {
    class robot {
    public:
        robot();

        std::string name() const;
    private:
        static std::string letters = "AA";
        static int number = -1;

        std::string next_name();
        void increment_number();
        void increment_letters();

        std::string inner_name;
    }
}

#endif
