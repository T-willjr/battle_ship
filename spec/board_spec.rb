require 'pry'
require './lib/board'
require './lib/ship'
require './lib/cell'

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

  it "#place a ship" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    board.place(cruiser, ["A1", "A2", "A3"])
    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)

  end

  it "#place a ship" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    cell_4 = board.cells["A4"]

    board.place(cruiser, ["A1", "A2", "A3"])
    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)
    expect(cell_4.ship).to eq(nil)

  end
end
