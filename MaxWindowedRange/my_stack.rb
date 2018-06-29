class MyStack
  def initialize
    @store = []
  end
  
  def pop
    @store.pop
  end
  
  def push(el)
    @store.push(el)
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