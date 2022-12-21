class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(person, book)
    @date = Time.now

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

end
