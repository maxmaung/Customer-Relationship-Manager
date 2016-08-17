class Contact

  @@contacts = []
  @@ids = 0
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note
  # This method should initialize the contact's attributes
  def initialize (first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @@ids += 1
    @id = @@ids
    @@contacts << self

  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name,last_name,email,note)
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if id == contact.id
        return contact
      end
    end

  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update (attribute, new_value)

      if attribute == "First_Name"
        @first_name = new_value
      elsif attribute == "Last_Name"
        @last_name = new_value
      elsif attribute == "Email"
        @email = new_value
      elsif attribute == "Note"
        @note = new_value
      else
        puts "Invalid Entry"
    end

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by (attribute, value)

    @@contacts.each do |contact| # contact in the pipe is just for a name for each object in the array

  if attribute == "first_name" && contact.first_name == value
    return contact # the object that is in the array, see line 68
  elsif attribute == "last_name" && contact.last_name == value
    return contact
  elsif attribute == "email" && contact.email == value
      return contact
  elsif attribute == "note" && contact.note == value
      return contact
  end
end

  end

  # This method should delete all of the contacts
  def self.delete_all
      @@contacts.delete
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
      @@contacts.delete(self)

  end

  # Feel free to add other methods here, if you need them.

end
