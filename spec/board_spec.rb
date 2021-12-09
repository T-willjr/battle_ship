require 'pry'
require './lib/board'

RSpec.describe Board do
  context "The Cells" do
    it "exists" do
      board = Board.new
      expect(board).to be_an_instance_of Board
    end

    it "has cells" do
      board = Board.new

      expect(board.cell_hash.count).to eq(16)

      board.cell_hash.each do |coordinate, cell|
        expect(cell).to be_an_instance_of Cell
      end
    end
  end

  context "Validating Coordinates" do
    it "tells us if a coordinate is on board" do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to be true
      expect(board.valid_coordinate?("D4")).to be true
      expect(board.valid_coordinate?("A5")).to be false
      expect(board.valid_coordinate?("E1")).to be false
      expect(board.valid_coordinate?("A22")).to be false
    end
  end
end
