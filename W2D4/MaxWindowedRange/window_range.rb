require_relative 'min_max_stack_queue'

def windowed_max_range_p1(arr, window_size)
  current_max_range = nil
  arr.each_with_index do |num, idx|
    next if idx + window_size > arr.length
    window = arr[idx...idx + window_size]
    range = window.max - window.min
    current_max_range = range if current_max_range.nil?
    current_max_range = range if range > current_max_range
  end
  current_max_range
end

def windowed_max_range_p7(arr, window_size)
  stack = MinMaxStackQueue.new
  current_max_range = nil
  arr.each do |num|
    stack.enqueue(num)
    # next if stack.size != window_size
    p stack.max, stack.min
    range = stack.max - stack.min
    current_max_range = range if current_max_range.nil?
    current_max_range = range if range > current_max_range
    stack.dequeue if stack.size >= window_size
  end
  current_max_range
end
p windowed_max_range_p7([1, 0, 2, 5, 4, 8], 2) == 4# 4, 8
p windowed_max_range_p7([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range_p7([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range_p7([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

