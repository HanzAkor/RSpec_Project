class ContactList
  def initialize
    @contacts = []
  end

  def add(contact_details)# contact_details is an instance of Contact
    # adds contact_details to empty list
    @contacts << contact_details
  end

  def all
    # Returns list of all contacts
    return @contacts
  end

  def format
    formatted = "Contacts== "
    formatted += @contacts.map{|contact| contact.format}.join(", ")
    return formatted
  end

end