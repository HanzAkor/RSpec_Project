require 'check_grammar'

RSpec.describe 'check_grammar method' do
  context 'given an empty string' do
    it "fails" do
      expect { check_grammar("") }.to raise_error "Not a sentence."
    end
  end

  context 'given a sentence with a capital letter and full stop' do
    it 'returns true'do
      result = check_grammar("Hello, I am Hannah.")
      expect(result).to eq true
    end
  end

  context 'given a sentence without capital letter' do
    it 'returns false'do
      result = check_grammar("hello, I am Hannah.")
      expect(result).to eq false
    end
  end

  context 'given a sentence without a full stop' do
    it 'returns false'do
      result = check_grammar("Hello, I am Hannah")
      expect(result).to eq false
    end
  end

  context 'given a sentence with first word in all capital letters' do
    it 'returns true'do
      result = check_grammar("HELLO, I am Hannah.")
      expect(result).to eq true
    end
  end

  context 'given a sentence with a capital letter an exclamation mark' do
    it 'returns true
    'do
      result = check_grammar("Hello, I am Hannah!")
      expect(result).to eq true
    end
  end

  context 'given a sentence with a capital letter a question mark' do
    it 'returns true
    'do
      result = check_grammar("Hello, I am Hannah?")
      expect(result).to eq true
    end
  end

  context 'given a sentence with a capital letter and a comma' do
    it 'returns false
    'do
      result = check_grammar("Hello, I am Hannah,")
      expect(result).to eq false
    end
  end
end