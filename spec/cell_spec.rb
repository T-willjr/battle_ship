require './lib/ship'
require './lib/cell'
require 'pry'

RSpec.describe Cell do
  subject {cell = Cell.new("B4")}
  it "can create an instance" do

    expect(subject).to be_an_instance_of Cell
    expect(subject.coordinate).to eq('B4')
  end

  it "#empty?" do

    expect(subject.empty?).to be true
  end
end
