require  'greet'

RSpec.describe 'greet' do
  it 'greet a given user' do
    result = greet("Hannah")
    expect(result).to eq "Hello, Hannah!"  
  end
end

