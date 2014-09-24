class Phone

  @@list_of_phones = []

  def initialize(name)
    @name = name
    @numbers = []
  end

  def name
    @name
  end

  def number
    @numbers.join(',')
  end

  def add(phone)
    @numbers << phone
  end

  def self.all
    @@list_of_phones
  end

  def save
    @@list_of_phones << self
  end

end


