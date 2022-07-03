class DiaryEntry 
  def initialize(title, contents, contacts)
    @title = title
    @contents = contents
    @contacts = contacts
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    return 0 if @contents.empty?
    return words = @contents.count(" ") + 1
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
      fail "WPM must be positive." unless wpm.positive?
      return (count_words / wpm.to_f).ceil 
  end

  def contacts # contacts is an instance of ContactList
    # Returns list of contacts
   return @contacts
  end

  def format_entry
    # Returns an array of the form => ["my title, my contents, Contacts== Full Name1: 07111222333, Full Name2: 07123456789"]
    "#{@title}, #{@contents}, #{@contacts.format}"
  end
end