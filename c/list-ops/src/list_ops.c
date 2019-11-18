#include "list_ops.h"

list_t* new_list(size_t length, list_value_t values[]) {
    list_t* out = malloc(sizeof(list_t) + length * sizeof(int));

    out->length = length;
    memcpy(out->values, values, length * sizeof(list_value_t));

    return out;
}

list_t* append_list(list_t* list1, list_t* list2) {
    size_t new_length = list1->length + list2->length;
    list_value_t new_values[new_length];

    size_t i = 0;

    for (size_t j = 0; j < list1->length; ++j) {
        new_values[i++] = list1->values[j];
    }

    for (size_t k = 0; k < list2->length; ++k) {
        new_values[i++] = list2->values[k];
    }

    return new_list(new_length, new_values);
}

list_t* filter_list(list_t* list, bool(*filter) (list_value_t value)) {
    // We need to iterate through the input list to determine the size
    // of the new list
    size_t new_length = 0;

    for (size_t i = 0; i < list->length; ++i) {
        if (filter(list->values[i]))
            ++new_length;
    }

    list_value_t new_values[new_length];

    // Then, need to iterate through it again to actually populate the
    // new list
    size_t j = 0;

    for (size_t i = 0; i < list->length; ++i) {
        if (filter(list->values[i]))
            new_values[j++] = list->values[i];
    }

    return new_list(new_length, new_values);
}

size_t length_list(list_t* list) {
    return list->length;
}

list_t* map_list(list_t* list, list_value_t(*map) (list_value_t value)) {
    list_value_t new_values[list->length];

    for (size_t i = 0; i < list->length; ++i) {
        new_values[i] = map(list->values[i]);
    }

    return new_list(list->length, new_values);
}

list_value_t foldl_list(list_t* list, list_value_t initial,
                        list_value_t(*foldl) (list_value_t value,
                                              list_value_t initial)) {
    for (size_t i = 0; i < list->length; ++i) {
        initial = foldl(list->values[i], initial);
    }

    return initial;
}

list_value_t foldr_list(list_t* list, list_value_t initial,
                        list_value_t(*foldr) (list_value_t value,
                                              list_value_t initial)) {
    for (size_t i = 0; i < list->length; ++i) {
        initial = foldr(list->values[list->length - 1 - i], initial);
    }

    return initial;
}

list_t* reverse_list(list_t* list) {
    list_value_t new_values[list->length];

    // Create a reversed copy of the input list
    for (size_t i = 0; i < list->length; ++i) {
        new_values[list->length - 1 - i] = list->values[i];
    }

    // Copy the contents to the input list
    memcpy(list->values, new_values, list->length * sizeof(list_value_t));

    // For some reason, the signature requires a list_t* to be returned,
    // but the tests require that the input list be modified in place
    return list;
}

void delete_list(list_t* list) {
    free(list);
}
