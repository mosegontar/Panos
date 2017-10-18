class Stack
    def initialize(maxsize=100)
        @contents = Array.new
        @maxsize = maxsize
    end

    def push(item)
        @contents.push item
    end

    def pop
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

