class Fibonacci
  def initialize
    @cache = { 1 => 1, 2 => 1 }
  end

  def fibonacci(n)
    start_time = Time.now
    return @cache[n] unless @cache[n].nil?
    
    ans = fibonacci(n - 1) + fibonacci(n - 2)
    @cache[n] = ans
    end_time = Time.now

    puts "That took #{end_time - start_time} seconds!"

    ans
  end
end