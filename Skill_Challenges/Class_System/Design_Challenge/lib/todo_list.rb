class TodoList
  def initialize
    # ...tasks => list of all the tasks ([])
    @tasks = []    
  end

  def add(task) # task is a string representing an instruction
    # add task to list of tasks
    # No return value
    @tasks << task
  end

  def format_entry
    # Returns a list of the tasks added as strings in format
    return @tasks
  end
end