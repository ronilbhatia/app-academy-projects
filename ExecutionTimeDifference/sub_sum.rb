def largest_contiguous_subsum_p1(list)
  sub_arrays = []
  list.each_with_index do |num, idx|
    list[idx+1...list.length].each_with_index do |num2, jdx|
      sub_arrays << list[idx..jdx]
    end
  end
  sums = sub_arrays.map {|l| l.reduce(:+)}
  sums.max
end

def largest_contiguous_subsum_p2(list)
  max = list.first
  sub_max = 0
  
  list.each do |num|
    sub_max += num
    max = sub_max if sub_max > max
    sub_max = 0 if sub_max < 0
  end
  
  max
end
# 
# p largest_contiguous_subsum_p2([-5, -1, -3])