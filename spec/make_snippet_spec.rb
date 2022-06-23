require 'make_snippet'

RSpec.describe "make_snippet method" do
  it "returns the first five words of a string and replaces extra words with ..." do
    result = make_snippet("this string is five words long")
    expect(result).to eq "this string is five words ..."
  end
end