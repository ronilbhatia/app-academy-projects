require_relative 'deck'

class Hand
  attr_reader :hand
  
  def initialize(hand)
    @hand = hand
  end
  
  def high_card
    high_card = nil
    hand.each do |card|
      if high_card.nil? || card.value >= high_card.value
        high_card = card
      end
    end
    
    high_card
  end
  
  def one_pair
    find_pairs.empty? ? false : find_pairs[0]
  end
  
  def two_pair
    find_pairs.length == 2 ? find_pairs[0..1] : false
  end
  
  def find_pairs
    all_pairs = []
    i = 0
    
    while i < (hand.length - 1)
      j = i + 1
      card1 = self.hand[i]
      
      while j < hand.length
        card2 = self.hand[j]
        
        if card1.value == card2.value
        
          all_pairs << [card1, card2] unless all_pairs.flatten.include?(card1)
          
        end
        
        j += 1
      end
      i += 1
    end
    
    all_pairs
    
    
  end
  
  def three_of_a_kind
    hand.each do |card|
      same_cards = hand.select {|card2| card.value == card2.value }
      return same_cards if same_cards.length == 3
    end
    false
  end
  
  def straight
    sorted_hand = hand.sort_by { |card| card.value }
    sorted_hand_values = sorted_hand.map { |card| card.value }
    return self if sorted_hand_values = [1, 10, 11, 12, 13]
    i = 0
    
    while i < sorted_hand.length - 1
      card1 = sorted_hand[i]
      return false if (card1.value + 1) != (sorted_hand[i+1].value)
      
      i += 1
    end
    
    self
  end
  
  def flush
    hands_suits = hand.map { |card| card.suit }
    return self if hands_suits.all? {|suit| suit == hands_suits[0]}
  end
end