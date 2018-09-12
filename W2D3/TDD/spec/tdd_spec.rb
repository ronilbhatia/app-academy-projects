require 'tdd_practice'

RSpec.describe Array do
  
  describe "#my_uniq" do
    
    subject(:arr) { [1,2,3,1,1] }
    
    it "removes duplicate elements" do
      expect(arr.my_uniq).to eq([1,2,3])
    end
    
    it "does not call Array#uniq" do
      expect(arr).to_not receive(:uniq)
      arr.my_uniq
    end
  end 
  
  describe "#two_sum" do
    subject(:arr) { [-1, 1] }
    
    it "returns the indexes that sum to zero" do
      expect(arr.two_sum).to eq([[0, 1]])
    end
    
    it "is an array of indexes inside an array" do
      expect(arr.two_sum.length).to eq(1)
    end
  end
  
  describe "#my_transpose" do
    subject(:arr) { [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
      ]}
      
    let(:arr_2) { [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
      ]}
    
    it "changes rows and columns in an array" do
      expect(arr.my_transpose).to eq(arr_2)
    end
    
    it "does not call Array#transpose" do
      expect(arr).to_not receive(:transpose)
      arr.my_transpose
    end
    
    let(:arr_3) { [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 1, 2]
      ]}
    
    let(:arr_4) { [
      [0, 3, 6, 0],
      [1, 4, 7, 1],
      [2, 5, 8, 2]
    ]}
    
    it "transposes rectangular matrices" do
      expect(arr_3.my_transpose).to eq(arr_4)
    end
  end
  
  describe "#stock_prices" do
    subject(:arr) { [5, 10, 13, 8, 7]}
    
    it "returns an array of indexes where the first index is the day you buy and the second is day you sell" do
      expect(arr.stock_prices).to eq([0,2])
    end
    
    it "it makes sure the buy date is before the sell date" do
      expect([14, 5, 10, 13, 8, 7].stock_prices).to eq([1,3])
    end
    
    it "it makes sure the sell date is after the buy date" do
      expect([5, 10, 13, 8, 7, 2].stock_prices).to eq([0,2])
    end
  end
end