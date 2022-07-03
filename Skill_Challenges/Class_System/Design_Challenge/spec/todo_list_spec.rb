require 'todo_list'

RSpec.describe TodoList do
  context 'initially' do
    it 'returns an empty list' do
      todo_list = TodoList.new
      expect(todo_list.format_entry).to eq []
    end
  end

  context 'when we add tasks to the list' do
    it 'displays the list of all tasks' do
      todo_list = TodoList.new
      todo_list.add("Clean the house")
      todo_list.add("Wash the car")
      todo_list.add("Wash the dishes")      
      expect(todo_list.format_entry).to eq ["Clean the house", "Wash the car", "Wash the dishes"]
    end
  end
end