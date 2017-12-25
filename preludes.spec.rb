require 'rspec'
require_relative 'preludes'

describe 'alt_name' do
  it 'returns correct alt name' do
    expect(Preludes.alt_name('A♭ minor')).to eq 'G♯ major'
  end
end
