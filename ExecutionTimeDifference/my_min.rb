def my_min_p1(list)
  list.each_with_index do |num, idx|
    min = true
    list[idx + 1...list.length].each do |num2|
      min = false if num2 < num1
    end
    return num if min
  end
end

def my_min_p2(list)
  min = list.first
  list.each {|num| min = num if num < min}
  min
end