class BinaryMinHeap
  def initialize(&prc)
    @store = []
    @prc = prc || Proc.new { |x, y| x <=> y }
  end

  def count
    store.length
  end

  def extract
    store[0], store[count-1] = store[count-1], store[0]
    val = store.pop
    self.class.heapify_down(store, 0, &prc)

    val
  end

  def peek
    store[0]
  end

  def push(val)
    store << val
    self.class.heapify_up(store, count - 1, &prc)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    left_child_index = parent_index * 2 + 1
    right_child_index = parent_index * 2 + 2

    [left_child_index, right_child_index].select { |index| index < len }
  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    child_indices = self.child_indices(len, parent_idx)

    # Figure out index of smallest child
    if child_indices.length == 2
      if prc.call(array[child_indices[0]], array[child_indices[1]]) == -1
        smallest_child_idx = child_indices[0]
      else
        smallest_child_idx = child_indices[1]
      end
    elsif child_indices.length == 1
      smallest_child_idx = child_indices[0] 
    else
      return array
    end

    while prc.call(array[parent_idx], array[smallest_child_idx]) == 1
      array[parent_idx], array[smallest_child_idx] = array[smallest_child_idx], array[parent_idx]
      # Reassign parent_idx and child_indices
      parent_idx = smallest_child_idx
      child_indices = self.child_indices(len, parent_idx)
      # Figure out index of new smallest child
      if child_indices.length == 2
        if prc.call(array[child_indices[0]], array[child_indices[1]]) == -1
          smallest_child_idx = child_indices[0]
        else
          smallest_child_idx = child_indices[1]
        end
      elsif child_indices.length == 1
        smallest_child_idx = child_indices[0] 
      end
    end

    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0
    prc ||= Proc.new { |x, y| x <=> y }
    parent_idx = self.parent_index(child_idx)

    while prc.call(array[parent_idx], array[child_idx]) == 1
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
      # Reassign child_idx and parent_idx
      child_idx = parent_idx
      # Return array if we are at the root otherwise error will be thrown
      return array if child_idx == 0
      parent_idx = self.parent_index(child_idx)
    end

    array
  end
end
