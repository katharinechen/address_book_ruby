class Email

  @@list_of_emails = []

  def initialize(name)
    @name = name
    @emails = []
  end

  def name
    @name
  end

  def email
    @emails.join(',')
  end

  def add(emails)
    @emails << emails
  end

  def self.all
    @@list_of_emails
  end

  def save
    @@list_of_emails << self
  end

end


