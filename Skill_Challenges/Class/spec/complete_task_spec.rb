require 'complete_task'

RSpec.describe TodoList do
  describe '#add' do
    context 'given no tasks' do
      it 'has an empty list' do
        todo_list = TodoList.new
        expect(todo_list.list).to eq []
      end
    end
    
    context 'given a task' do
      it 'adds task to the list' do
        todo_list = TodoList.new
        todo_list.add("Wash the car")
        expect(todo_list.list).to eq ["Wash the car"]
      end
    end

    context 'given two tasks' do
      it 'adds tasks to the list' do
        todo_list = TodoList.new
        todo_list.add("Wash the car")
        todo_list.add("Wash the dog")
        expect(todo_list.list).to eq ["Wash the car", "Wash the dog"]
      end
    end
  end

  describe '#complete' do
    context 'one task has been completed' do
      it 'removes task from the list' do
        todo_list = TodoList.new
        todo_list.add("Wash the car")
        todo_list.add("Wash the dog")
        todo_list.complete("Wash the car")
        expect(todo_list.list).to eq ["Wash the dog"]
      end
    end

    context 'when trying to complete a non-existent task' do
      it "fails" do
        todo_list = TodoList.new
        todo_list.add("Wash the car")
        expect { todo_list.complete("Wash the sheep") }.to raise_error "No such task."
      end
    end
  end

end