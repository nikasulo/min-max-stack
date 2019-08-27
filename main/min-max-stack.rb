require_relative '../lib/node'
class Stack
    def initialize
        @first = nil
    end

    def pushFront(number)
        @first = Node.new(number, @first)
        @min = @first if @min.nil?
        @max = @first if @max.nil?
        @min = Node.new(number, @min) if number < self.min?
        @max = Node.new(number, @max) if number > self.max?
    end

    def popFront
        @min = @min.next_node if @min.value == @first.value
        @max = @max.next_node if @max.value == @first.value
        element = @first
        @first = @first.next_node
        element.value
    end

    def topFront
        @first.value
    end

    def is_empty?
        @first.nil?
    end

    def min?
        @min.value if !@min.nil?
    end

    def max?
        @max.value if !@max.nil?
    end

end

# s = Stack.new
# s.pushFront(3)
# s.pushFront(6)
# s.pushFront(2)
# s.pushFront(1)
# s.popFront
# s.popFront
# s.popFront
# p s.topFront
# p s.is_empty?
# p s.min?
# p s.max?