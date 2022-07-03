require 'string_builder'

RSpec.describe StringBuilder do
  it 'takes a string and adds it to an existing string' do
    string_builder = StringBuilder.new()
    string_builder.add("apple")
   # result = string_builder.output
   # expect(result).to eq "apple"
    expect(string_builder.size).to eq 5
    expect(string_builder.output).to eq "apple"
  end
end