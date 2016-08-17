require_relative 'contact'

class CRM

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
    end
  end

  def print_main_menu
  puts '[1] Add a new contact'
  puts '[2] Modify an existing contact'
  puts '[3] Delete a contact'
  puts '[4] Display all the contacts'
  puts '[5] Search by attribute'
  puts '[6] Exit'
  puts 'Enter a number:'
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact

  print 'Enter First Name: '
  first_name = gets.chomp

  print 'Enter Last Name: '
  last_name = gets.chomp

  print 'Enter Email Address: '
  email = gets.chomp

  print 'Enter a Note: '
  note = gets.chomp

  Contact.create(first_name, last_name, email, note)

  end

  def modify_existing_contact

    display_all_contacts

    puts "Please choose the ID for the contact you want to update"
    id = gets.chomp.to_i

    contact = Contact.find(id)

    puts "Please choose what you want to update: First_Name, Last_Name, Email, Note"
    attribute = gets.chomp

    puts "Enter New Value"
    new_value = gets.chomp
    contact.update(attribute,new_value)

  end

  def delete_contact
    displaycontact = Contact.all
    displaycontact.each do |contact|
      puts "ID: #{contact.id} FirstName:#{contact.first_name} LastName:#{contact.last_name} E-Mail:#{contact.email} Note:#{contact.note}"
    end
    puts "Enter ID to delete"
    answer = gets.chomp.to_i

    contact = Contact.find (answer)
    contact.delete

  end

  # This method should accept as an argument an array of contacts
  # and display each contact in that array
  def display_contacts(contact_list)
    # puts "Enter ID for single contact or ALL for all contacts"
    # answer = gets.chomp
    # case answer
    #
    # when "ALL" then Contact.all
    # when "ID" then Contact.find(answer)
    # else "Invalid Option"
    # end
    contact_list.each do |contact|
      puts "ID : #{contact.id} #{contact.full_name}, #{contact.email}, #{contact.note}"
    end
    # HINT: Make use of this method in the display_all_contacts and search_by_attribute methods to keep your code DRY
  end

  def display_all_contacts
    display_contacts(Contact.all)

    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  def search_by_attribute

    puts "Choose what category to search by: First_Name, Last_Name, EMail, Note"
    answer_attribute = gets.chomp.downcase

    puts "What do you want to search for?"
    answer_value = gets.chomp.downcase

    return_value = Contact.find_by(answer_attribute,answer_value)

    display_contacts([return_value])
    
    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  # Add other methods here, if you need them.

end

mycrm = CRM.new()
mycrm.main_menu
