class Entry

  attr_accessor :name, :phone_number, :email

  def initialize(name, phone_number, email)
    @name, @phone_number, @email = name, phone_number, email
  end

  def to_s
    "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
  end

  def ==(other)
    self.name == other.name && self.phone_number == other.phone_number && self.email == other.email
  end
end
