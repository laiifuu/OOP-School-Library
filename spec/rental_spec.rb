require './rental'
require './book'
require './student'

describe Rental do
  context 'Testing the Rental class' do
    book = Book.new('The Evil Forest', 'Ahmed')
    student = Student.new('Harry Potter', 19, true)
    date = '12-12-2022'
    rental = Rental.new(student, book, date)

    it 'should validate the date of the rental' do
      expect(rental.date).to eq date
    end

    it 'should validate the person who rented the book' do
      expect(rental.person).to eq student
    end

    it 'should validate the book being rented' do
      expect(rental.book).to eq book
    end
  end
end
