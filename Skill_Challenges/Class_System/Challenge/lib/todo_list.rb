# File: lib/todo_list.rb
class TodoList
  def initialize
    @all_tasks = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    @all_tasks << todo
  end

  def incomplete
    # Returns all non-done todos
    return @all_tasks
  end

  def complete
    # Returns all complete todos
    return @all_tasks.filter {|item| item.done? == true} 
  end

  def give_up!
    # Marks all todos as complete
    @all_tasks.each { |todo| todo.mark_done! }
  end
end
