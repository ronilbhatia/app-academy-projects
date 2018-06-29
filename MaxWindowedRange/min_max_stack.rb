class MinMaxStack
  def initialize
    @store = []
    @max = nil
    @min = nil
  end
  
  def pop
    @store.pop
    
  end
  
  def push(el)
    @max = el if @max.nil? || el > @max
    @min = el if @min.nil? || el < @min
    @store.push(el)
  end
  
  def min
    @min
  end
  
  def max
    @max
  end
  
  def peek
    @store.last
  end
  
  def empty?
    @store.empty?
  end
  
  def size
    @store.length
  end
end