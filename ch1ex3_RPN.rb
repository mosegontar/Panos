require "./ch1ex1_stack"

OPERATORS = ['+', '-', '*', '/', '**', '//']

def rpn_calc(arr)
    s = Stack.new

    arr.split.each do |i|
        if OPERATORS.include?(i)
            b = s.pop
            a = s.pop
            result = a.public_send(i.to_sym, b)
            s.push result
        elsif !OPERATORS.include?(i)
            s.push i.to_i
        end
    end
    s.top
end

str = "1 2 3 * + 2 - 2 **"

p rpn_calc str



