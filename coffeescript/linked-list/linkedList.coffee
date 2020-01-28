class Node
    constructor: (@value) ->
        @prev = @next = null


class LinkedList
    constructor: ->
        @head = @tail = null
        @count = 0

    # Creates a new node with the given value and attaches it to the end
    # of the list
    pushNode: (n) ->
        if @count
            old_tail = @tail
            new_tail = new Node(n)

            old_tail.next = new_tail
            new_tail.prev = old_tail

            @tail = new_tail
        else
            @head = @tail = new Node(n)

        @count += 1

    # Deletes the tail and returns its value
    popNode: ->
        return unless @count

        output = @tail.value

        @tail = @tail.prev
        @tail?.next = null

        @count -= 1

        return output

    # Deletes the head and returns its value
    shiftNode: ->
        return unless @count

        output = @head.value

        @head = @head.next
        @head?.prev = null

        @count -= 1

        return output

    # Creates a new node with the given value and attaches it to the
    # beginning of the list
    unshiftNode: (n) ->
        if @count
            old_head = @head
            new_head = new Node(n)

            old_head.prev = new_head
            new_head.next = old_head

            @head = new_head
        else
            @head = @tail = new Node(n)

        @count += 1

    # Searches for the first node with the given value -- starting from
    # the head -- and returns it
    findNode: (n) ->
        curr = @head
        curr = curr.next until curr.value == n or not curr?
        return curr

    # Searches for the first node with the given value and deletes it
    deleteNode: (n) ->
        return unless @count

        node = @findNode(n)

        return unless node

        node.prev?.next = node.next
        node.next?.prev = node.prev

        @head = node.next if node == @head
        @tail = node.prev if node == @tail

        @count -= 1

    countNodes: ->
        @count


module.exports = LinkedList
