require 'grammar_stats'

RSpec.describe GrammarStats do
  context 'where no text is given' do
    it "fails" do
      grammar_stats = GrammarStats.new
      expect { grammar_stats.check("") }.to raise_error "Checked nothing so far!"
    end
  end


  describe 'check' do
    context 'where given text begins with capital letter and ends with correct punctuation' do
      it 'returns true if conditions are met' do
        grammar_stats = GrammarStats.new
        result = grammar_stats.check("This is a proper sentence.")
        expect(result).to eq true
      end
    end
    
    context 'where given text does not begin with capital letter and ends with correct punctuation' do
      it 'returns true if conditions are met' do
        grammar_stats = GrammarStats.new
        result = grammar_stats.check("this is a proper sentence.")
        expect(result).to eq false
      end
    end

    context 'where given text begins with capital letter and does not end with correct punctuation' do
      it 'returns true if conditions are met' do
        grammar_stats = GrammarStats.new
        result = grammar_stats.check("This is a proper sentence")
        expect(result).to eq false
      end
    end
  end


  describe 'percentage_good' do
    context 'when only one text is checked' do
      it 'returns percentage of texts checked so far that passed the check' do
        grammar_stats = GrammarStats.new
        grammar_stats.check("This is a proper sentence.")
        result = grammar_stats.percentage_good
        expect(result).to eq 100
      end 
    end

    context 'when two text is checked and one passes' do
      it 'returns percentage of texts checked so far that passed the check' do
        grammar_stats = GrammarStats.new
        grammar_stats.check("This is a proper sentence.")
        grammar_stats.check("This is a proper sentence")
        result = grammar_stats.percentage_good
        expect(result).to eq 50
      end 
    end

    context 'when three text is checked and two pass' do
      it 'returns percentage of texts checked so far that passed the check' do
        grammar_stats = GrammarStats.new
        grammar_stats.check("This is a proper sentence.")
        grammar_stats.check("This is a proper sentence!")
        grammar_stats.check("This is a proper sentence")
        result = grammar_stats.percentage_good
        expect(result).to eq 66.67
      end 
    end

  end


end
