require_relative 'card'

class Deck
  attr_reader :cards
  
  def initialize(cards = Deck.build_deck)
    @cards = cards
    # shuffle!
  end
  
  def self.build_deck
    deck = []
    Card::SUITS.each do |suit|
      (1..13).each { |value| deck << Card.new(value, suit) }
    end
    deck
  end
  
  def shuffle!
    @cards.shuffle!
  end
end
