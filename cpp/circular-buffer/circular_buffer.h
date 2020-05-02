#ifndef CIRCULAR_BUFFER_H
#define CIRCULAR_BUFFER_H

#include <cstddef>

namespace circular_buffer {
    template <typename T>
    class circular_buffer {
        size_t capacity;
        int head, tail;
        T* buffer;
    public:
        circular_buffer(size_t);
        ~circular_buffer();
        size_t size() const;
        bool empty() const;
        bool full() const;
        T read();
        void write(const T&);
        void clear();
        void overwrite(const T&);
    };
}

#include "circular_buffer.ipp"

#endif
