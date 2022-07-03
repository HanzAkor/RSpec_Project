require 'diary'
require 'diary_entry'
require 'todo_list'

RSpec.describe 'integrated_diary_todo_contacts' do
  it 'lists out entries added and includes a todo list' do
    diary = Diary.new
    contact1 = Contact.new("Full Name1", "07111222333")
    contact2 = Contact.new("Full Name2", "07444555666")
    contact3 = Contact.new("Full Name3", "07777888999")
    contact4 = Contact.new("Full Name3", "07123456789")
  
    contacts1 = ContactList.new
    contacts2 = ContactList.new
    contacts3 = ContactList.new

    contacts1.add(contact1)
    contacts1.add(contact2)
    contacts2.add(contact3)
    contacts3.add(contact4)

    diary_entry1 = DiaryEntry.new("my title", "one", contacts1)
    diary_entry2 = DiaryEntry.new("my title 2", "one two three", contacts2)
    diary_entry3 = DiaryEntry.new("my title 2", "one two three four", contacts3)


    diary.add_entry(diary_entry1)
    diary.add_entry(diary_entry2)
    diary.add_entry(diary_entry3)

    todo_list = TodoList.new
    todo_list.add("Clean the house")
    todo_list.add("Wash the car")
    todo_list.add("Wash the dishes")

    #  p @entries
     
    result = diary.include_todo_list(todo_list.format_entry)
    expect(result).to eq  ["Clean the house", "Wash the car", "Wash the dishes"]
    formatted = diary.format_diary
    expect(formatted).to eq [todo_list.format_entry, [[diary_entry1.format_entry], [diary_entry2.format_entry], [diary_entry3.format_entry]]]


    # diary = {
    #    todo_list => tasks,
    #    entries => [ [diary_entry1], [diary_entry2], [diary_entry3] ]
    # }

  end

  describe 'counting behaviour' do
    it 'counts the words in all diary entries contents' do
      diary = Diary.new
      contact1 = Contact.new("Full Name1", "07111222333")
      contact2 = Contact.new("Full Name2", "07444555666")
      contact3 = Contact.new("Full Name3", "07777888999")
     
      contacts1 = ContactList.new
      contacts2 = ContactList.new
      contacts1.add(contact1)
      contacts1.add(contact2)
      contacts2.add(contact3)

      diary_entry1 = DiaryEntry.new("my title", "my contents", contacts1)
      diary_entry2 = DiaryEntry.new("my title 2", "my contents 2", contacts2)

      diary.add_entry(diary_entry1)
      diary.add_entry(diary_entry2)
      expect(diary.count_words).to eq 5
    end
  end

  describe 'reading time behaviour' do
    it 'calculates the reading time for all the diary entries' do
      diary = Diary.new
      contact1 = Contact.new("Full Name1", "07111222333")
      contact2 = Contact.new("Full Name2", "07444555666")
      contact3 = Contact.new("Full Name3", "07777888999")
     
      contacts1 = ContactList.new
      contacts2 = ContactList.new
      contacts1.add(contact1)
      contacts1.add(contact2)
      contacts2.add(contact3)

      diary_entry1 = DiaryEntry.new("my title", ("one " * 200).rstrip, contacts1)
      diary_entry2 = DiaryEntry.new("my title 2", ("one " * 550).rstrip, contacts2)

      diary.add_entry(diary_entry1)
      diary.add_entry(diary_entry2)
      expect(diary.reading_time(200)).to eq 4
    end

    context 'where it fits exactly' do
      it 'calculates the reading time for all the diary entries' do
        diary = Diary.new
      contact1 = Contact.new("Full Name1", "07111222333")
      contact2 = Contact.new("Full Name2", "07444555666")
      contact3 = Contact.new("Full Name3", "07777888999")
     
      contacts1 = ContactList.new
      contacts2 = ContactList.new
      contacts1.add(contact1)
      contacts1.add(contact2)
      contacts2.add(contact3)

      diary_entry1 = DiaryEntry.new("my title", "my contents", contacts1)
      diary_entry2 = DiaryEntry.new("my title 2", "my contents 2", contacts2)

      diary.add_entry(diary_entry1)
      diary.add_entry(diary_entry2)
        expect(diary.reading_time(2)).to eq 3
      end
    end

    context 'where it does not fit exactly' do
      it 'calculates the reading time for all the diary entries' do
        diary = Diary.new
      contact1 = Contact.new("Full Name1", "07111222333")
      contact2 = Contact.new("Full Name2", "07444555666")
      contact3 = Contact.new("Full Name3", "07777888999")
     
      contacts1 = ContactList.new
      contacts2 = ContactList.new
      contacts1.add(contact1)
      contacts1.add(contact2)
      contacts2.add(contact3)

      diary_entry1 = DiaryEntry.new("my title", "my contents", contacts1)
      diary_entry2 = DiaryEntry.new("my title 2", "my contents 2", contacts2)

      diary.add_entry(diary_entry1)
      diary.add_entry(diary_entry2)
        expect(diary.reading_time(2)).to eq 3
      end
    end

    context 'when no wpm given' do
      it "fails" do
        diary = Diary.new
        expect { diary.reading_time(0) }.to raise_error "WPM must be positive."
      end
    end
  end

  describe 'best reading time entry behaviour' do
    it 'fails where wpm is 0' do
      diary = Diary.new
      contact1 = Contact.new("Full Name1", "07111222333")
      contact2 = Contact.new("Full Name2", "07444555666")
     
      contacts1 = ContactList.new
      contacts1.add(contact1)
      contacts1.add(contact2)

      diary_entry1 = DiaryEntry.new("my title", "my contents", contacts1)
      diary.add_entry(diary_entry1)
      expect { diary.find_best_entry_for_reading_time(0, 1) }.to raise_error  "WPM must be positive."
    end

    context 'where we just have one entry and it is exactly readable in the time' do
      it 'returns that entry' do 
        diary = Diary.new
        contact1 = Contact.new("Full Name1", "07111222333")
        contact2 = Contact.new("Full Name2", "07444555666")     
        contacts1 = ContactList.new
        contacts2 = ContactList.new
        contacts1.add(contact1)
        contacts1.add(contact2)
        diary_entry1 = DiaryEntry.new("my title", "my contents", contacts1)
        diary.add_entry(diary_entry1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq diary_entry1
      end
    end

    context 'where we just have one entry and it is unreadable in the time' do
      it 'returns nil' do
        diary = Diary.new
        contact1 = Contact.new("Full Name1", "07111222333")
        contact2 = Contact.new("Full Name2", "07444555666")    
        contacts1 = ContactList.new
        contacts1.add(contact1)
        contacts1.add(contact2)
        diary_entry1 = DiaryEntry.new("my title", "my contents longer", contacts1)
        diary.add_entry(diary_entry1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq nil
      end
    end

    context 'where we have multiple entries' do
      it 'returns the longest readable entry within the time' do 
        diary = Diary.new
        contact1 = Contact.new("Full Name1", "07111222333")
        contact2 = Contact.new("Full Name2", "07444555666")
        contact3 = Contact.new("Full Name3", "07777888999")
        contact4 = Contact.new("Full Name3", "07123456789")
      
        contacts1 = ContactList.new
        contacts2 = ContactList.new
        contacts3 = ContactList.new

        contacts1.add(contact1)
        contacts1.add(contact2)
        contacts2.add(contact3)
        contacts3.add(contact4)

        diary_entry1 = DiaryEntry.new("my title", "one", contacts1)
        diary_entry2 = DiaryEntry.new("my title 2", "one two three", contacts2)
        diary_entry3 = DiaryEntry.new("my title 2", "one two three four", contacts3)


        diary.add_entry(diary_entry1)
        diary.add_entry(diary_entry2)
        diary.add_entry(diary_entry3)

        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq diary_entry1
      end
    end
  end
end
