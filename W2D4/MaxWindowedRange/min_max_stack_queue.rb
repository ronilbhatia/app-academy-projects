require_relative "min_max_stack"

class MinMaxStackQueue
  def initialize
    @current_stack = MinMaxStack.new
    @spare = MinMaxStack.new
  end
  
  def enqueue(el)
    @current_stack.push(el)
  end
  
  def max
    @current_stack.max
  end

  def min
    @current_stack.min
  end
  
  def dequeue
    until @current_stack.empty?
      @spare.push(@current_stack.pop)
    end
    
    el = @spare.pop
    
    until @spare.empty?
      @current_stack.push(@spare.pop)
    end
    
    el
  end
  
  def size
    @current_stack.size
  end
  
  def empty?
    @current_stack.empty?
  end
end