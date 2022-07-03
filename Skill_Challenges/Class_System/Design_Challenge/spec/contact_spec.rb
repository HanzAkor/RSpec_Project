require 'contact'

RSpec.describe Contact do
  it 'contructs a contact' do
    contact = Contact.new("Full Name", "07123456789")
    expect(contact.format).to eq  "Full Name: 07123456789"
  end
end