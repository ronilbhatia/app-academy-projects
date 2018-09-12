def first_anagram?(str1, str2)
  perm = str1.chars.permutation.to_a
  perm.map! {|word| word.join}
  perm.include?(str2)
end

def second_anagram?(str1, str2)
  arr1 = str1.chars
  arr2 = str2.chars
  arr1.each_with_index do |char1, idx1|
    arr2.each_with_index do |char2, idx2|
      if char1 == char2
        arr1[idx1] = ""
        arr2[idx2] = ""
        break
      end
    end
  end
  arr1.join.empty? && arr2.join.empty?
end

# p second_anagram?("racecar", "carrace")
# p second_anagram?("john", "oasdiuhw")
# p second_anagram?("mag", "gam")

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  hsh = Hash.new(0)

  str1.chars.product(str2.chars) do |char1, char2|
    hsh[char1] += 1
    hsh[char2] -= 1
  end
  
  hsh.values.all? { |value| value.zero? }
end

p fourth_anagram?("racecar", "carrace")
p fourth_anagram?("john", "oasdiuhw")
p fourth_anagram?("mag", "gam")