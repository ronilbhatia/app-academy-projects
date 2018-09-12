require 'byebug'
def bad_two_sum?(arr, target)
  arr.each_with_index do |num1, idx1|
    arr[idx1+1...arr.length].each do |num2|
      return true if (num1 + num2) == target
    end
  end
  false
end
# Time Complexity of bad_two_sum? (N^2)/2
class Array
  def bsearch(target)
    return nil if empty?
    mid_idx = length/2
    return target if self[mid_idx] == target
    
    side = self[mid_idx] > target ? self[0...mid_idx] : self[mid_idx+1...length]
    
    side.bsearch(target)
  end
end

def okay_two_sum?(arr, target)
  arr.sort!
  arr.each_with_index do |num, idx|
    goal = target - num
    arr3  = arr[idx+1..-1]
    val = arr3.bsearch(goal)
    return true unless val.nil?
  end
  false
end

# What does sorting do to the lower bound of your time complexity?
# On average, sets the lower bound to nlog(n) rather than n^2 like the loops
# How might sorting that make the problem easier?
# It doesn't.

def two_sum?(arr, target)
  hsh = Hash.new
  arr.each do |num|
    return true if hsh.has_key?(target-num)
    hsh[num] = true
  end
  false
end