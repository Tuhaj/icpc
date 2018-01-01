require 'rspec'
require_relative 'polish'

describe 'polish' do
  it 'returns correct simplification' do
    expect(Polish.new('+34').simplify).to eq '7'
  end

  it "returns correct simplification for -xx" do
    expect(Polish.new('-xx').simplify).to eq '-xx'
  end

  it 'returns correct simplification for * - 6 + x -6 - - 9 6 * 0 c' do
    expect(Polish.new('* - 6 + x -6 - - 9 6 * 0 c').simplify).to eq '* - 6 + x -6 - 3 * 0 c'
  end
end
