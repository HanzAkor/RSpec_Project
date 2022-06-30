def get_most_common_letter(text)
  counter = Hash.new(0)
  # "at the start, counter is #{Hash.new(0)}"
  text.chars.each do |char|
    counter[char] += 1
  # "we iterate over each character in text, then add it to counter. we are counting each characters occurances as we go along the text: #{counter}"
  end

   counter.to_a.sort_by { |k, v| v}[-2][0] # sorts from lowest occurance to highest.
 # highest occurance [-1] is a space, so target the second index [-2] from the end to get the hihest occurring character
end

# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"

p get_most_common_letter("the roof, the roof, the roof is on fire!")