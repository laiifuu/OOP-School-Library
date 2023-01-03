class Rental
  attr_accessor :date
  attr_reader :person, :book, :id

  def initialize(person, book, date)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def to_json(*args)
    {
      'date' => @date,
      'book' => @book,
      'person' => @person
    }.to_json(*args)
  end
end
