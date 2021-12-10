require 'pry'
require './lib/board'
require './lib/ship'

RSpec.describe Board do
  subject {board = Board.new}
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
    let(:cruiser) { Ship.new("Cruiser", 3) }
    let(:submarine) { Ship.new("Submarine", 2) }

    it "validates that ship will fit in coordinates" do
      expect(subject.valid_placement?(cruiser, ["A1", "A2"])).to be false
      expect(subject.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
      expect(subject.valid_placement?(cruiser, ["A1", "A2", "A3"])).to be true
    end
  end

end
