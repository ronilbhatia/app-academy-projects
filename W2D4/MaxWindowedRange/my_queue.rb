class MyQueue
  def initialize
    @store = []
  end
  
  def enqueue(element)
    @store << element
  end
  
  def dequeue
    @store.shift
  end
  
  def peek
    @store.first
  end
  
  def empty?
    @store.empty?
  end
  
  def size
    @store.length
  end
end