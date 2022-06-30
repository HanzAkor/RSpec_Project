require 'reading_time'

RSpec.describe 'reading_time method' do
  context 'given an empty string' do
    it 'returns zero' do
      result = calculate_reading_time("")
      expect(result).to eq 0
    end
  end

  context 'when text is less than 200 words' do
    it 'returns 1' do
    result = calculate_reading_time("one two")
    expect(result).to eq 1
    end
  end

  context 'when text is 200 words' do
    it 'returns 1' do
    result = calculate_reading_time("one " * 200)
    expect(result).to eq 1
    end
  end

  context 'when text is 300 words' do
    it 'returns 2' do
    result = calculate_reading_time("one " * 300)
    expect(result).to eq 2
    end
  end

  context 'when text is 400 words' do
    it 'returns 2' do
    result = calculate_reading_time("one " * 400)
    expect(result).to eq 2
    end
  end

  context 'when text is 5000 words' do
    it 'returns 2' do
    result = calculate_reading_time("one " * 5000)
    expect(result).to eq 25
    end
  end
end