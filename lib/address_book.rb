class Contact

  @@list_of_contacts = []

  def initialize (name,number,email,address)
    @name = name
    @number = number
    @email = email
    @address = address

  end

  def name
    @name
  end

  def number
    @number
  end

  def email
    @email
  end

  def address
    @address
  end

  def self.all
    @@list_of_contacts
  end

  def save
    @@list_of_contacts << self
  end

  def self.clear
    @@list_of_contacts = []
  end

  def self.remove(name)
    @@list_of_contacts.delete_if { |x| x == name }
  end

  def edit_info(new_number, new_email, new_address)
    @number = new_number
    @email = new_email
    @address = new_address
  end

end
