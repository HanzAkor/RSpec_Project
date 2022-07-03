require 'report_length'

RSpec.describe 'report_length method' do
  it 'takes a string and returns number of characters in that string' do
    result = report_length("Hannah")
    expect(result).to eq "This string was 6 characters"
  end
end