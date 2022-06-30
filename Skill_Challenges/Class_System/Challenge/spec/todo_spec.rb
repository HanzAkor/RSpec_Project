require 'todo'

RSpec.describe Todo do
  it 'constructs' do
    todo = Todo.new("Clean the house")
    expect(todo.task).to eq "Clean the house"
  end

  describe '#mark_done!' do
    context 'when tasks is empty' do
      it 'fails' do
        todo = Todo.new("")
        expect { todo.mark_done! }.to raise_error "There is nothing to mark as complete!"
      end
    end

    context 'when task is complete' do
      it 'it is labelled _done!' do
        todo = Todo.new("Clean the house")
        expect(todo.mark_done!).to eq "Clean the house :_done!"
      end 

      it 'returns true' do
        todo = Todo.new("Clean the house")
        todo.mark_done!
        expect(todo.done?).to eq true
      end
    end
  end
end