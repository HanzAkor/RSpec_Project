=begin
 
DO NOT DO THIS. THE PROGRAM WILL STOP IMMEDIATELY AND THE METHOD WON'T RETURN ANYTHING ANY MORE!

require 'reminder_2'

RSpec.describe Reminder do
  context "when no task is set" do
    it "fails" do
      reminder = Reminder.new("Hannah")
      result = reminder.remind()
      expect(result).to eq "No reminder set!"
    end
  end
end

=end

# DO THIS INSTEAD:

require 'reminder_2'

RSpec.describe Reminder2 do
  context "when no task is set" do
    it "fails" do
      reminder_2 = Reminder2.new("Hannah")
      expect { reminder_2.remind() }.to raise_error "No reminder set!"
    end
  end
end