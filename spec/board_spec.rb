require 'pry'
require './lib/board'

RSpec.describe Board do
  it "exists" do
    board = Board.new
    expect(board).to be_an_instance_of Board
  end

  it "has cells" do
    board = Board.new

    board.cell_hash.each do |coordinate, cell|
      expect(cell).to be_an_instance_of Cell
    end
    expect(board.cell_hash.count).to eq(16)
  end
end
