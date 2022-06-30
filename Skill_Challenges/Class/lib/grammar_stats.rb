class GrammarStats
  def initialize
    # ...
   @texts_passed = 0
   @texts_checked = 0
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    fail "Checked nothing so far!" if text.empty?

    first_char = text[0]
    last_char = text[-1]
    start_with_capital = first_char == first_char.upcase
    end_with_punctuation = /[?!.]/.match?(last_char)

    
    @texts_checked += 1

    if start_with_capital && end_with_punctuation
      @texts_passed += 1
      return true
    else
      return false
    end


  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.

    # if I check one 'text' and it passes => 100%
    # if I check two 'text's and only one passes => 50%
    # if I check four 'text's and three pass => 75%

    # if I check three 'text's and two pass => 66.67%

    # (no_of_texts_passed / total_no_of_texts) * 100 = % passed
    # (no_of_texts_passed.fdiv(Rational(total_no_of_texts))  * 100).ceil(2) = % passed

    # need a 'counter' method to count how many 'text's have passed the check

  percentage = (@texts_passed.fdiv(Rational(@texts_checked.to_f)) * 100).ceil(2)
    return percentage

  end
end