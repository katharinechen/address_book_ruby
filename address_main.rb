require './lib/address_book'

# @list = []
def main_menu
  system 'clear'
  loop do

    puts "What would you like to do?\n"
    puts "A) Add a contact?"
    puts "L) List contacts?"
    puts "E) Exit?\n"
    answer = gets.chomp.upcase

    if answer == "A"
      add_contact
    elsif answer == "E"
      exit
    elsif answer == "L"
      list_contacts
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

  new_contact = Contact.new(name, number, email, address)
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
      puts person.number
      puts person.email
      puts person.address
    end
  end
end

main_menu
