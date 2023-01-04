require './book'
require './student'

describe Book do
  context 'Testing the Book class' do
    title = 'The Evil Forest'
    author = 'Ahmed'
    book = Book.new(title, author)

    it 'should validate the title of the book' do
      expect(book.title).to eq title
    end

    it 'should validate the author of the book' do
      expect(book.author).to eq author
    end

    it 'should add a rental properly' do
      student = Student.new('NAME', 24, true)
      book.add_rental(student, '12-12-2020')
      expect(book.rentals.length).to eq 1
    end
  end
end
