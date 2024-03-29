class Diary
  def initialize
    @diaryKV = {tasks: [], entries: []}
  end

  def entries
    return @diaryKV.fetch(:entries)
  end


  def add_entry(diary_entry) # entry is an instance of DiaryEntry
  # entry gets added to the diary
  # # Returns nothing 
  @diaryKV[:entries] = entries << diary_entry

  # put entries in kv
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
      # entries =  @diaryKV.fetch(:entries)
    
       return entries.map do |diary_entry|
        diary_entry.count_words
      end.sum
  # alternatively => return entries.sum(&:count_words)
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
    # @entries.insert(0, tasks)

     @diaryKV[:tasks] = tasks
    # puts @diaryKV

  end

  def format_diary
    # Returns a list of entry objects
    # Returns list of tasks
    # Formats diary in an array to the form => [[todo_list], ["my title, my contents, Contacts== Full Name1: 07111222333, Full Name2: 07123456789"]]

    
      entries =  @diaryKV.fetch(:entries)
      tasks =  @diaryKV.fetch(:tasks)
      formatted_entries = entries.map { |diary_entry| [diary_entry.format_entry] }
      # puts formatted_entries
     return [tasks, formatted_entries]
   
  end


  private

  def readable_entries(wpm, minutes)

    return entries.select do |entry|
      entry.reading_time(wpm) <= minutes
    end
  end

end
