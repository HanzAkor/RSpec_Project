require 'present'

RSpec.describe Present do

  it 'wraps and unwraps an item' do
    present = Present.new
    present.wrap("iPhone 13")
    expect(present.unwrap).to eq "iPhone 13"
  end

  context 'when contents have already been wrapped' do
    it "fails" do
      present = Present.new
      present.wrap("iPhone 13")
      expect { present.wrap("iPhone 13") }.to raise_error "A contents has already been wrapped."
    end
  end

  context 'when no contents have been wrapped' do
    it "fails" do
      present = Present.new
      expect { present.unwrap }.to raise_error "No contents have been wrapped."
    end
  end
end