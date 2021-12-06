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
end
