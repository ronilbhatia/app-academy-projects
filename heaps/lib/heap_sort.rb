require_relative "heap"

class Array
  def heap_sort!
    # Setup max heap
    prc = Proc.new { |x, y| x <=> y }
    min_heap = BinaryMinHeap.new(&prc)
    # Iterate through array, building max heap as we go
    self.each { |el| min_heap.push(el) }
    # Extract all elements into result array
    self.map! { min_heap.extract }
  end
end
