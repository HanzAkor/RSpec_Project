class Contact
  def initialize(name, number) # title and artist are both strings
    @name = name
    @number = number
  end

  def name
    # Returns name
    @name
  end

  def number
    # Returns number
    @number
  end

  def format
    # Returns a string of the form "Full Name: mobile number"
  
    return "#{@name}: #{@number}"
  end
end