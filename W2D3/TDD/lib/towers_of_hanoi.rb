class TowersOfHanoi
  attr_accessor :towers
  
  def initialize
    @towers = [[3,2,1],[],[]]
  end
  
  def get_input
    puts "Which tower would you like to move from?"
    input_1 = gets
    puts "Which tower would you like to move to?"
    input_2 = gets
    
    [input_1, input_2]
  end
  
  def move(from_tower, to_tower)
    if towers[to_tower].empty? || towers[from_tower].last < towers[to_tower].last
      towers[to_tower] << towers[from_tower].pop
    else
      raise ArgumentError
    end
  end
  
  def won?
    return true if towers[1].size == 3 || towers[2].size == 3
    false
  end
end