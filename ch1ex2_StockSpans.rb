require 'benchmark'
require './ch1ex1_stack'


quotes = Array.new(100000) { rand(1..9) }
def simple_stock_span(quotes)
    spans = Array.new
    0.upto(quotes.length-1) do |i|
        k = 1
        span_end = false
        while i - k >= 0 && !span_end do
            if quotes[i-k] <= quotes[i]
                k += 1
            else
                span_end = true
            end
        end
        spans[i] = k
    end
    spans
end


def stack_stock_span(quotes)
    spans = Array.new
    spans[0] = 1

    s = Stack.new
    s.push(0)

    1.upto(quotes.length-1) do |i|
        while !s.empty? && quotes[s.top] <= quotes[i] do
            s.pop
        end
        if s.empty?
            spans[i] = i + 1
        else
            spans[i] = i - s.top
        end
        s.push(i)
    end
    spans
end

Benchmark.bm do |b|
    b.report("Stack Stock Span") { stack_stock_span quotes }
    b.report("Simple Stock Span") { simple_stock_span quotes }
end

# For Array.length of 100,000 the  stack_stock_span completed in ~0.09 seconds
# while simple_stock_span completed in ~44.30 seconds.
# Conclusion: stacks are good.