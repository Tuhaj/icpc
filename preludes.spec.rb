require 'rspec'
require_relative 'preludes'

describe 'alt_name' do
  it 'returns correct alt name' do
    expect(Preludes.new('Ab minor').alt_name).to eq 'G# minor'
  end

  it "doesn't return wrong alt name" do
    expect(Preludes.new('A♭ minor').alt_name).not_to eq 'A♭ minor'
  end
end

describe 'icpc test cases' do
  it 'returns correct input for Ab minor' do
    expect(Preludes.new('Ab minor').alt_name).to eq 'G# minor'
  end

  it 'returns correct input for D# major' do
    expect(Preludes.new('D# major').alt_name).to eq 'Eb major'
  end

  it 'returns correct input for G minor' do
    expect(Preludes.new('G minor').alt_name).to eq 'UNIQUE'
  end
end
