require 'task_tracker'

RSpec.describe 'task_tracker method' do
  context 'if given an empty string' do
    it "fails" do
      expect {task_tracker("")}.to raise_error "Not a task!"
    end
  end

  context 'when given text including keyword #TODO' do
    it 'returns true' do
      result = task_tracker("#TODO Washing up")
      expect(result).to eq true
    end
  end

  context 'when given text including keyword #TODO lowercased' do
    it 'returns true' do
      result = task_tracker("#todo Washing up")
      expect(result).to eq true
    end
  end

  context 'when given text including keyword #TODO with a space' do
    it 'returns false' do
      result = task_tracker("#TO DO Washing up")
      expect(result).to eq false
    end
  end

  context 'when given text including keyword #TODO with a space and lowercased' do
    it 'returns false' do
      result = task_tracker("#to do Washing up")
      expect(result).to eq false
    end
  end 

  context 'when given text without keyword #TODO' do
    it 'returns false' do
      result = task_tracker("Washing up")
      expect(result).to eq false
    end
  end  

  context 'when given text including keyword TODO without # symbol' do
    it 'returns false' do
      result = task_tracker("TODO Washing up")
      expect(result).to eq false
    end
  end  
end