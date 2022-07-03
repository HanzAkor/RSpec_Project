require 'gratitudes'

RSpec.describe Gratitudes do 
  it 'intitially returns an empty list of gratitudes, and formats the list' do
    gratitudes = Gratitudes.new
    expect(gratitudes.format).to eq "Be grateful for: "
  end

  it 'adds given gratitudes to list of gratitudes' do
    gratitudes = Gratitudes.new
    gratitudes.add("breathing")
  end

   # gratitudes.format"Be grateful for: breathing, "
end