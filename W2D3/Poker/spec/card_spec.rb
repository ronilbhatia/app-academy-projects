require 'card'

describe Card do
  subject(:new_card) { Card.new(5, "Spades") }
  
  describe "#initialize" do
    it "sets a value" do
      expect(new_card.value).to eq(5)
    end
    
    it "sets a suit" do
      expect(new_card.suit).to eq("Spades")
    end
    
    context "when there are invalid parameters" do
    let(:dummy_suit) { Card.new(6, "Spakes") }
      
      it "only accepts a valid suit" do
        expect { dummy_suit.suit }.to raise_error(ArgumentError)
      end
          
    let(:dummy_value) { Card.new(14, "Spades") }
      it "only acceps a valid value" do
        expect { dummy_value.value }.to raise_error(ArgumentError)
      end
    end
  end 
end