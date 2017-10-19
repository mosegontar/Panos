require './ch1ex1_stack'

DELIMS = {
    '}' => '{',
    ')' => '(',
    ']' => '['
}

class Stack
    def balanced?
        self.empty?
    end
end

def deliminator(delims)
    s = Stack.new
    
    return false if DELIMS.keys.include?(delims[0])
    s.push delims[0]

    delims[1..-1].each do |delim|
        if DELIMS.keys.include?(delim) && s.top == DELIMS[delim]
            s.pop
        else
            s.push delim
        end
    end
    s.balanced?
end

delims = ['[', '(', ')', '{', '}', '(', '(', '[', ']', ')', ')', ']']


p deliminator '[ ( ( ) ) [ ( ) ] ] { }'.split