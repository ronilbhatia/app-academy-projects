require_relative 'my_stack'

class StackQueue
  def initialize
    @current_stack = MyStack.new
    @spare = MyStack.new
  end
  
  def enqueue(el)
    @current_stack.push(el)
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
    @current_stack.length
  end
  
  def empty?
    @current_stack.empty?
  end
end