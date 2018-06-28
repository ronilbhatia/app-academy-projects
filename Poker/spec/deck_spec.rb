require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  let(:cards) { deck.cards.dup }
  
  describe "#initialize" do
    it "creates a standard deck with 52 cards" do
      expect(deck.cards.length).to eq(52)
    end
  end
  
  describe "#shuffle" do
    it "builds a randomize deck" do
      expect(cards).to_not eq(deck.shuffle!)
    end
  end
end