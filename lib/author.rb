class Author
  attr_reader :first_name, :last_name
  attr_accessor :email

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @email = nil
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end
end