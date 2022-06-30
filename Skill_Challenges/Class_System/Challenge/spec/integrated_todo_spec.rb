require 'todo_list'
require 'todo'

RSpec.describe 'integrated_todo' do
  context 'when we add tasks to the list' do
    it 'displays the list of all tasks' do
      todo_list = TodoList.new
      todo_1 = Todo.new("Clean the house")
      todo_2 = Todo.new("Wash the car")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.incomplete).to eq [todo_1, todo_2]
    end
  end

  describe 'completing behaviour' do
    context 'when one task has been completed' do
      it 'returns that task' do
        todo_list = TodoList.new
        todo_1 = Todo.new("Clean the house")
        todo_list.add(todo_1)
        todo_1.mark_done!
        expect(todo_list.complete.map {|todo| todo.task }).to eq ["Clean the house :_done!"]
      end
    end

    context 'when multiple tasks have been completed' do
      it 'returns those tasks' do
        todo_list = TodoList.new
        todo_1 = Todo.new("Clean the house")
        todo_2 = Todo.new("Wash the car")
        todo_3 = Todo.new("Wash the dishes")
        todo_list.add(todo_1)
        todo_list.add(todo_2)
        todo_list.add(todo_3)
        todo_1.mark_done!
        todo_2.mark_done!
        result = todo_list.complete
        expect(result.map {|todo| todo.task }).to eq ["Clean the house :_done!", "Wash the car :_done!"]
      end
    end

    describe 'completing all behaviour' do
      it 'marks all tasks as complete' do
        todo_list = TodoList.new
        todo_1 = Todo.new("Clean the house")
        todo_2 = Todo.new("Wash the car")
        todo_3 = Todo.new("Wash the dishes")
        todo_list.add(todo_1)
        todo_list.add(todo_2)
        todo_list.add(todo_3)
        result = todo_list.give_up!.map {|todo| todo.task }
        expect(result).to eq ["Clean the house :_done!", "Wash the car :_done!", "Wash the dishes :_done!"]
      end
    end

  end
end