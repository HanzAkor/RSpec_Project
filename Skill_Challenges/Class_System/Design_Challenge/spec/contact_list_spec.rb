require 'contact_list'
require 'contact'

RSpec.describe ContactList do
  context 'initially' do
    
    it 'produces an empty list' do
      contact_list = ContactList.new
      contact = Contact.new("Full Name", "07111222333")
      expect(contact_list.all).to eq []
    end
  end

  context 'adding behaviour' do
    it 'adds one formatted contact' do
      contact_list = ContactList.new
      contact = Contact.new("Full Name", "07111222333")
      contact_list.add(contact)
      expect(contact_list.all.map{|contact| contact.format}).to eq ["Full Name: 07111222333"]
    end

    it 'gets all contacts' do
      contact_list = ContactList.new
      contact1 = Contact.new("Full Name1", "07111222333")
      contact2 = Contact.new("Full Name2", "07444555666")
      expect(contact1.format).to eq "Full Name1: 07111222333" 
      expect(contact2.format).to eq "Full Name2: 07444555666" 
      # binding.irb
      contact_list.add(contact1)
      contact_list.add(contact2)
      # binding.irb
     formatted = contact_list.format
    #  p formatted
      expect(formatted).to eq "Contacts== Full Name1: 07111222333, Full Name2: 07444555666" 
    end
  end
end