require 'diary_entry'
require 'contact_list'

RSpec.describe DiaryEntry do
  it 'constructs diary entry' do
    contact1 = Contact.new("Full Name1", "07111222333")
    contact2 = Contact.new("Full Name2", "07444555666")
    contacts = ContactList.new
    contacts.add(contact1)
    contacts.add(contact2)
    diary_entry = DiaryEntry.new("my title", "my contents", contacts)
    expect(diary_entry.title).to eq "my title"
    expect(diary_entry.contents).to eq "my contents"
    # binding.irb
    # expect(diary_entry.contacts).to eq ["Full Name1: 07111222333, Full Name2: 07444555666"]
    result =  diary_entry.contacts.all.map {|contact| contact.format}
    expect(result).to eq ["Full Name1: 07111222333", "Full Name2: 07444555666"]
  
  end

  describe '#count_words' do
    it 'counts the number of words in contents' do
      contact1 = Contact.new("Full Name1", "07111222333")
      contact2 = Contact.new("Full Name2", "07444555666")
      contacts = ContactList.new
      contacts.add(contact1)
      contacts.add(contact2)
      diary_entry = DiaryEntry.new("my title", "my contents", contacts)
      expect(diary_entry.count_words).to eq 2
    end

    it 'returns zero when contents is empty' do
      contact1 = Contact.new("Full Name1", "07111222333")
      contact2 = Contact.new("Full Name2", "07444555666")
      contacts = ContactList.new
      contacts.add(contact1)
      contacts.add(contact2)
      diary_entry = DiaryEntry.new("my title", "", contacts)
      expect(diary_entry.count_words).to eq 0
    end
  end

  describe '#reading_time' do
    it "fails" do
      contact1 = Contact.new("Full Name1", "07111222333")
      contact2 = Contact.new("Full Name2", "07444555666")
      contacts = ContactList.new
      contacts.add(contact1)
      contacts.add(contact2)
      diary_entry = DiaryEntry.new("my title", "my contents", contacts)
      expect { diary_entry.reading_time(0) }.to raise_error "WPM must be positive."
    end

    context 'when contents is empty' do
      it 'returns zero' do
        contact1 = Contact.new("Full Name1", "07111222333")
        contact2 = Contact.new("Full Name2", "07444555666")
        contacts = ContactList.new
        contacts.add(contact1)
        contacts.add(contact2)
        diary_entry = DiaryEntry.new("my title", "", contacts)
        expect(diary_entry.reading_time(200)).to eq 0
      end
    end

    context 'given a wpm of some sensible number of words (200)' do
      it 'returns the ceiling of the number of minutes it takes to read the contents' do
        contact1 = Contact.new("Full Name1", "07111222333")
        contact2 = Contact.new("Full Name2", "07444555666")
        contacts = ContactList.new
        contacts.add(contact1)
        contacts.add(contact2)
        diary_entry = DiaryEntry.new("my title", "my contents", contacts)
        expect(diary_entry.reading_time(200)).to eq 1
      end

      it 'returns the ceiling of the number of minutes it takes to read the contents' do
        contact1 = Contact.new("Full Name1", "07111222333")
        contact2 = Contact.new("Full Name2", "07444555666")
        contacts = ContactList.new
        contacts.add(contact1)
        contacts.add(contact2)
        diary_entry = DiaryEntry.new("my title", ("one " * 200).rstrip, contacts)
      #  p ("one " * 10).rstrip
        expect(diary_entry.reading_time(200)).to eq 1
      end

      it 'returns the ceiling of the number of minutes it takes to read the contents' do
        contact1 = Contact.new("Full Name1", "07111222333")
        contact2 = Contact.new("Full Name2", "07444555666")
        contacts = ContactList.new
        contacts.add(contact1)
        contacts.add(contact2)
        diary_entry = DiaryEntry.new("my title", ("one " * 550).rstrip, contacts)
        expect(diary_entry.reading_time(200)).to eq 3
      end
    end
  end  

  describe '#format_entry' do
    it 'formats all info in diary entry into one array' do
      contact1 = Contact.new("Full Name1", "07111222333")
      contact2 = Contact.new("Full Name2", "07444555666")
      contacts = ContactList.new
      contacts.add(contact1)
      contacts.add(contact2)
      diary_entry = DiaryEntry.new("my title", "my contents", contacts)
      expect(diary_entry.format_entry).to eq "my title, my contents, Contacts== Full Name1: 07111222333, Full Name2: 07444555666"
    end
  end
end