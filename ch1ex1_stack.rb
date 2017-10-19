class StackFullError < StandardError
    def initialize(msg="The stack is full")
        super
    end
end

class StackEmptyError < StandardError
    def initialize(msg="The stack is empty")
        super
    end
end

class Stack
    attr_reader :contents
    def initialize(maxsize=100)
        @contents = Array.new
        @maxsize = maxsize
    end

    def push(item)
        raise StackFullError if full?
        @contents.push item
    end

    def pop
        raise StackEmptyError if empty?
        @contents.pop
    end

    def top
        @contents.last
    end

    def empty?
        @contents.empty?
    end

    def size
        @contents.length
    end

    def full?
        @contents.size == @maxsize
    end
end

