#include <stdexcept>

template <typename T>
circular_buffer::circular_buffer<T>::circular_buffer(size_t n) {
    capacity = n;
    head = tail = 0;

    buffer = new T[capacity];
}

template <typename T>
circular_buffer::circular_buffer<T>::~circular_buffer() {
    delete[] buffer;
}

template <typename T>
size_t circular_buffer::circular_buffer<T>::size() const {
    return tail - head;
}

template <typename T>
bool circular_buffer::circular_buffer<T>::empty() const {
    return size() == 0;
}

template <typename T>
bool circular_buffer::circular_buffer<T>::full() const {
    return size() == capacity;
}

template <typename T>
T circular_buffer::circular_buffer<T>::read() {
    if (empty())
        throw std::domain_error("Reading empty buffer");

    return buffer[head++ % capacity];
}

template <typename T>
void circular_buffer::circular_buffer<T>::write(const T& item) {
    if (full())
        throw std::domain_error("Writing full buffer");

    buffer[tail++ % capacity] = item;
}

template <typename T>
void circular_buffer::circular_buffer<T>::clear() {
    head = tail = 0;
}

template <typename T>
void circular_buffer::circular_buffer<T>::overwrite(const T& item) {
    try {
        write(item);
    } catch (const std::domain_error&) {
        buffer[tail % capacity] = item;

        head += 1;
        tail += 1;
    }
}
