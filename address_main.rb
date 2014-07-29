require './lib/address_book'
require './lib/phone'
require './lib/email'
#require 'pry'

def main_menu
  system 'clear'
  loop do

    puts "What would you like to do?\n"
    puts "A) Add a contact?"
    puts "L) List contacts?"
    puts "D) Delete contact"
    puts "E) Exit?\n"
    answer = gets.chomp.upcase

    if answer == "A"
      add_contact
    elsif answer == "E"
      exit
    elsif answer == "L"
      list_contacts
    elsif answer == "D"
      delete_contact
    else
      puts "try again"
    end
  end
end

def add_contact
  puts "name"
  name = gets.chomp
  puts "number"
  number = gets.chomp
  puts "email"
  email = gets.chomp
  puts "address"
  address = gets.chomp
  new_email = Email.new(name)
  new_phone = Phone.new(name)
  new_email.add(email)
  new_email.save
  new_phone.add(number)
  new_phone.save
  new_contact = Contact.new(name, new_phone, new_email, address)
  new_contact.save
end

def list_contacts
  Contact.all.each do |person|
    puts person.name
  end

  puts "Type in the person's name to get more info"
  first_name = gets.chomp
  list_info(first_name)
end

def list_info(first_name)

  Contact.all.each do |person|
    if person.name == first_name
      puts person.name
      puts person.number.number
      puts person.email.email
      puts person.address
    end
  end

  puts "W) Would you like to add a phone number?"
  puts "E) Extend email list?"
  answer = gets.chomp.upcase

  if answer == "W"
    add_number(first_name)
  elsif answer == "E"
    add_email(first_name)
  else
    main_menu
  end

end

def add_number(first_name)

  puts "enter additional number"
  new_number = gets.chomp

  Phone.all.each do |phone|
    if phone.name == first_name
      phone.add(new_number)
      puts phone.number
    else
      "Please enter a valid name"
    end
  end

end

def add_email(first_name)

  puts "enter additional email"
  new_email = gets.chomp

  Email.all.each do |email|
    if email.name == first_name
      email.add(new_email)
      puts email.email
    else
      "Please enter a valid name"
    end
  end
end

def delete_contact
  puts "Enter name of contact to delete"
  deleted = gets.chomp
  Contact.all.each do |contact|
    if contact.name == deleted
      Contact.remove(contact)
    end
  end
  puts "Contact Deleted"
end

main_menu
