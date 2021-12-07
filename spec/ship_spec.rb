require './lib/ship'
require 'pry'

RSpec.describe Ship do
  subject {cruiser = Ship.new("Cruiser", 3)}
  it "can create an instance" do

    expect(subject).to be_an_instance_of Ship
  end

  it "has a name and length" do

    expect(subject.name).to eq("Cruiser")
    expect(subject.length).to eq(3)
  end

  it "has health" do
    expect(subject.health).to eq(3)
  end

  it "by default is not #sunk" do

    expect(subject.sunk?).to be false
  end

  it "can take a #hit" do

    subject.hit
    expect(subject.health).to eq(2)

    subject.hit
    expect(subject.health).to eq(1)
  end

  it "is #sunk when health is 0" do

    expect(subject.health).to eq (3)

    3.times {subject.hit}
    expect(subject.sunk?).to be true
  end
end
