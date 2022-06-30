# File: lib/diary.rb
class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
    # entry_1 => {title => title_1, contents => contents_1, count_words => count_words_1, reading_time => reading_time_1, reading_chunk => reading_chunk_1}
    # entry_2 => {title => title_2, contents => contents_2, count_words => count_words_2, reading_time => reading_time_2, reading_chunk => reading_chunk_2}
 
   @entries << entry 

  end

  def all
    # Returns a list of instances of DiaryEntry
    return @entries 
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    return  @entries.map do |entry|
        entry.count_words
      end.sum
  # alternatively => return @entries.sum(&:count_words)
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    fail "WPM must be positive." unless wpm.positive?
    return (count_words / wpm.to_f).ceil 
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read per minute.
        # `minutes` is an integer representing the number of minutes the user has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.

=begin
    readable_entries(wpm, minutes).max_by do |entry|
      entry.count_words
    end
=end

   return readable_entries(wpm, minutes).max_by(&:count_words)
  end

  private

  def readable_entries(wpm, minutes)

    return @entries.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end
  end

=begin
sorting readable_entries by longest entry within given time and reading speed
=>
      sorted_by_longest = readable_entries.sort_by do |entry|
        entry.count_words
      end

    return sorted_by_longest.last
=>
refactored within find_best_entry_for_reading_time
line 45
=end

end
