class Card
  attr_reader :value, :suit
  
  SUITS = ["Spades", "Clubs", "Hearts", "Diamonds"]
  VALUES = (1..13).to_a
  
  def initialize(value, suit)
    raise ArgumentError unless SUITS.include?(suit) 
    raise ArgumentError unless VALUES.include?(value)
    @value = value
    @suit = suit
  end
end