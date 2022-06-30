
# File: lib/todo.rb
class Todo
  def initialize(task) # task is a string
    # ...
    @task = task
  end

  def task
    # Returns the task as a string
    return @task  
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
    fail "There is nothing to mark as complete!" if @task.empty?
    @task.concat(" :_done!")
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
    if @task.end_with?(" :_done!")
      return true
    else 
      return false
    end
  end
end