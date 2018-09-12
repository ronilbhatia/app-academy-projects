class Array
  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    
    result
  end
  
  def two_sum
    result = []
    
    i = 0
    while i < (length - 1)
      num1 = self[i]
      j = i + 1
      
      while j < length
        num2 = self[j]
        result << [i,  j] if num1 + num2 == 0
        
        j += 1
      end
      i += 1
    end
    
    result
  end
  
  def my_transpose
    result = []
    
    i = 0
    while i < self[0].length
      current_row = []
      j = 0
      while j < length
        current_row << self[j][i]
        j += 1
      end
      result << current_row
      i += 1
    end
    
    result
  end
  
  def stock_prices
    max_profit = nil
    day_index = []
    i = 0
    
    while i < (length - 1)
      day1 = self[i]
      j = i + 1
      
      while j < length
        day2 = self[j]
        maybe_profit = day2 - day1
        
        if max_profit.nil? || maybe_profit > max_profit 
          max_profit = maybe_profit 
          day_index = [i, j]
        end
        
        j += 1
      end
      i += 1
    end
    
    day_index
  end
end