require 'pry'
require './lib/board'
require './lib/ship'
require './lib/cell'


RSpec.describe Board do
  subject {board = Board.new}
  let(:cruiser) { Ship.new("Cruiser", 3) }
  let(:submarine) { Ship.new("Submarine", 2) }
  context "The Cells" do

    it "exists" do
      expect(subject).to be_an_instance_of Board
    end

    it "has cells" do

      expect(subject.cell_hash.count).to eq(16)

      subject.cell_hash.each do |coordinate, cell|
        expect(cell).to be_an_instance_of Cell
      end
    end
  end

  context "#Validating Coordinates" do
    it "tells us if a coordinate is on board" do
      
      expect(subject.valid_coordinate?("A1")).to be true
      expect(subject.valid_coordinate?("D4")).to be true
      expect(subject.valid_coordinate?("A5")).to be false
      expect(subject.valid_coordinate?("E1")).to be false
      expect(subject.valid_coordinate?("A22")).to be false
    end
  end

  context "#valid_placement?" do

    it "validates that ship will fit in coordinates" do

      expect(subject.valid_placement?(cruiser, ["A1", "A2"])).to be false
      expect(subject.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
      expect(subject.valid_placement?(cruiser, ["A1", "A2", "A3"])).to be true
    end

    it "makes sure the coordinates are consecutive" do

      expect(subject.valid_placement?(cruiser,["A1", "A2", "A4"])).to be false
      expect(subject.valid_placement?(submarine,["A1", "C1"])).to be false
      expect(subject.valid_placement?(cruiser,["A3", "A2", "A1"])).to be false
      expect(subject.valid_placement?(submarine, ["C1", "B1"])).to be false
    end

    it "makes sure coordinates cannot be diagonal" do

      expect(subject.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be false
      expect(subject.valid_placement?(submarine, ["C2", "D3"])).to be false
    end

    it "makes sure happy paths work" do

      expect(subject.valid_placement?(submarine, ["A1", "A2"])).to be true
      expect(subject.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be true
    end

    it "makes sure ships cannot overlap" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
    end

    it "#place a ship, check that all corresponding cells are occupied" do
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

  context "#render" do
     it "renders the board" do

       subject.place(cruiser, ["A1", "A2", "A3"])

       expect(subject.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
       expect(subject.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  end
end
