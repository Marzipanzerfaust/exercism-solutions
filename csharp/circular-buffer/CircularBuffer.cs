using System;

public class CircularBuffer<T>
{
    int Capacity, Head, Tail;
    T[] Buffer;

    public CircularBuffer(int capacity)
    {
        Capacity = capacity;
        Head = Tail = 0;

        Buffer = new T[Capacity];
    }

    public int Size
    {
        get { return Tail - Head; }
    }

    public bool Empty()
    {
        return Size == 0;
    }

    public bool Full()
    {
        return Size == Capacity;
    }

    public T Read()
    {
        if (Empty())
            throw new InvalidOperationException();

        return Buffer[Head++ % Capacity];
    }

    public void Write(T value)
    {
        if (Full())
            throw new InvalidOperationException();

        Buffer[Tail++ % Capacity] = value;
    }

    public void Overwrite(T value)
    {
        try {
            Write(value);
        } catch (InvalidOperationException) {
            Buffer[Tail % Capacity] = value;

            Head += 1;
            Tail += 1;
        }
    }

    public void Clear()
    {
        Head = Tail = 0;
    }
}
