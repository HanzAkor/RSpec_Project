class TodoList  
  def initialize
    # ...#tasks => list of all the tasks ([])
    @tasks = []
  end

  def add(task) # task is a string representing an instruction
    # add task to list of tasks
    # No return value
  @tasks << task
  end

  def list
    # Returns a list of the tasks added as strings
    return @tasks
  end

  def complete(task) # task is a string representing a task to mark as complete
    # No return value
    # Fails if the task doesn't complete
    fail "No such task." unless @tasks.include? task
    @tasks.delete(task)
  end

end
