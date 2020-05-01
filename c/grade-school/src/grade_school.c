#include "grade_school.h"
#include <string.h>
#include <stdlib.h>

static roster_t roster = { 0 };

static int student_cmp(const void* lhs, const void* rhs) {
    const student_t* a = lhs;
    const student_t* b = rhs;

    if (a->grade < b->grade)
        return -1;
    else if (a->grade > b->grade)
        return 1;
    else
        return strcmp(a->name, b->name);
}

roster_t get_roster(void) {
    roster_t copy = roster;
    qsort(copy.students, copy.count, sizeof(student_t), student_cmp);

    return copy;
}

uint8_t add_student(char name[], uint8_t grade) {
    roster.students[roster.count++] = (student_t) {grade, name};
    return roster.count;
}

void clear_roster(void) {
    roster.count = 0;
}

roster_t get_grade(uint8_t grade) {
    roster_t output;
    roster_t sorted = get_roster();

    for (size_t i = 0; i < sorted.count; ++i) {
        student_t student = sorted.students[i];

        if (student.grade == grade)
            output.students[output.count++] = student;
    }

    return output;
}
