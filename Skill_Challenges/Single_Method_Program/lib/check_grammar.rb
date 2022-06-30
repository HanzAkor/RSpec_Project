def check_grammar(text)
  fail "Not a sentence." if text.empty?
=begin
  first_letter_is_capital = text[0] == text[0].upcase
  last_character_is_full_stop = text[-1] == "."
  last_character_is_quesion_mark = text[-1] == "?"
  last_character_is_exclamation_mark = text[-1] == "!"
  last_character = last_character_is_full_stop || last_character_is_quesion_mark || last_character_is_exclamation_mark

    if first_letter_is_capital && last_character
      return true
    else
      return false
    end
=end

  first_char = text.split("").first 
  last_char = text.split("").last

  start_with_capital = first_char == first_char.upcase
  end_with_punctuation = /[?!.]/.match?(last_char)

  return start_with_capital && end_with_punctuation

end