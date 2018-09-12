require 'hand'

describe Hand do
  let(:card1) { double("card1", value: 3) }
  let(:card2) { double("card2", value: 3) }
  let(:card3) { double("card3", value: 3) }
  let(:card4) { double("card4", value: 2) }
  let(:card5) { double("card5", value: 2) }
  subject(:hand) { Hand.new([card1, card2, card3, card4, card5])}
  let(:card6) { double("card6", value: 1) }
  let(:card7) { double("card7", value: 2) }
  let(:card8) { double("card8", value: 13) }
  let(:card9) { double("card9", value: 3) }
  let(:card10) { double("card10", value: 4) }
  subject(:hand_2) { Hand.new([card6, card7, card8, card9, card10])}
  
  describe "#initialize" do
    it "sets the player hand" do
      expect(hand.hand).to eq([card1, card2, card3, card4, card5])
    end
  end
  
  describe "#high_card" do
    it "returns the highest card in the players hand" do
      expect(hand.high_card).to eq(card3)
    end
  end
  
  describe "#one_pair" do

    it "returns the pair in the players hand" do
      expect(hand.one_pair).to eq([card1, card2])
    end
    
    it "returns false if the player does not have a pair" do
      expect(hand_2.one_pair).to be false
    end
  end
  
  describe "#two_pair" do 
    it "returns two pairs in the players hand" do
      expect(hand.two_pair).to eq([[card1, card2], [card4, card5]])
    end
    
    it "returns false if the player does not have TWO pairs" do
      expect(hand_2.two_pair).to be false
    end
  end
  
  describe "#three_of_a_kind" do
    it "returns three cards of the same value" do
      expect(hand.three_of_a_kind).to eq([card1, card2, card3])
    end
  end
  
  describe "#straight" do
    let(:card11) { double("card11", value: 10) }
    let(:card12) { double("card12", value: 12) }
    let(:card13) { double("card13", value: 11) }
    let(:card14) { double("card14", value: 1) }
    let(:card15) { double("card15", value: 13) }
    subject(:hand_3) { Hand.new([card11, card12, card13, card14, card15]) }
    
    it "returns a straight hand" do
      expect(hand_3.straight).to eq(hand_3)
    end
  end
end