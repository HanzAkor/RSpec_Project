class Diary
  def initialize
    # @diary_map = {:todo => [], :entries => []} 
    @entries = {todo: [], entries: []}
  end

  def add_entry(diary_entry) # entry is an instance of DiaryEntry
  # entry gets added to the diary
  # Returns nothing
 d_entries =  @diary_map.values_at(:diary_entries)
 d_entries << diary_entry
 @diary_map.store(:entries, d_entries)
 

#  h = {foo: 0, bar: 1}
# h[:foo] = 2 # => 2
# h.store(:bar, 3) # => 3
  # @entries << diary_entry 
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    entries = @diary_map.values_at(:diary_entries)
    return  entries.map do |diary_entry|
        diary_entry.count_words
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

  def include_todo_list(tasks) # tasks is an instance of TodoList
    # tasks gets added to the diary
    # Returns nothing
    @diary_map[:todo] = tasks
  end

  def format_diary
    # Returns a list of entry objects
    # Returns list of tasks

    
    # @entries[0] = todo_list.join(", ")
  

    diary_entries = @dairy_map.values_at(:entries).map { |diary_entry| [diary_entry.format_entry]} 

    if dairy_map.has_key?(:todo) do 
     todos = @dairy_map.values_at(:todo)
    #  diary_entries.insert(0, todos)

     return  [todos, diary_entries]
    end
    else
    [diary_entries]
    end
   
    # => [[todo_list], ["my title, my contents, Contacts== Full Name1: 07111222333, Full Name2: 07123456789"]]
  end





  private

  def readable_entries(wpm, minutes)

    return @entries.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end
  end

end