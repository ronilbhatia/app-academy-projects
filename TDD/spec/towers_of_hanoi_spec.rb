require 'towers_of_hanoi'

RSpec.describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }
  
  describe "#initialize" do
    it "should initialize with an array of 3 arrays" do
      expect(game.towers).to eq([[3,2,1],[],[]])
    end
  end
  
  describe "#get_input" do
    it "should prompt the user for input" do
      expect(game).to receive(:gets).exactly(2).times
      game.get_input
    end
  end
  
  describe "#move" do
    let(:arg1) { 0 }
    let(:arg2) { 1 } 
    
    # before(:each) { expect(arg1).to between(0, 2) }
    
    it "should take two arguments as input" do
      expect(game).to receive(:move).with(arg1, arg2)
      game.move(arg1, arg2)
    end
    
    it "should move between towers" do
      game.move(arg1, arg2)
      expect(game.towers).to eq([[3,2],[1],[]])
    end
    
    it "should not be able to move a bigger disc ontop of a smaller disc" do
      game.move(arg1, arg2)
      expect { game.move(arg1, arg2) }.to raise_error(ArgumentError)
    end
  end
  
  describe "#won?" do
    let(:winner) { [[], [3,2,1], []] }
    
    it "returns true if another tower is filled" do
      game.towers = winner
      expect(game.won?).to be true
    end
    
    it "returns false if game is not won" do
      game.towers = [[], [3,2], [1]]
      expect(game.won?).to be false
    end
  end
end