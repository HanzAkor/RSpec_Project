require 'reminder'

RSpec.describe 'Reminder' do
  it 'reminds the user to do a task' do
    reminder = Reminder.new("Hannah")
    reminder.remind_me_to("Practice coding")
    result = reminder.remind()
    expect(result).to eq "Practice coding, Hannah!"
  end
end