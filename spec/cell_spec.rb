require './lib/ship'
require './lib/cell'
require 'pry'

RSpec.describe Cell do
  subject {cell = Cell.new("B4")}
  it "can create an instance" do

    expect(subject).to be_an_instance_of Cell
    expect(subject.coordinate).to eq('B4')
  end

  it "#ship" do

    expect(subject.ship).to eq([])
  end

  it "#empty?" do

    expect(subject.empty?).to be true
  end

  it "#place_ship" do
    cruiser = Ship.new("Cruiser", 3)
    subject.place_ship(cruiser)
    expect(subject.ship).to eq([cruiser])
    expect(subject.empty?).to be false
  end

  it "#fired_upon?" do
    cruiser = Ship.new("Cruiser", 3)
    expect(subject.fired_upon?).to be false
    
    # subject.fired_upon
    # expect(subject.fired_upon?).to be true
    # expect(subject.ship.health).to eq(2)
  end


end
