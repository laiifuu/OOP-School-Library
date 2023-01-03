require 'json'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

def save()
  file_names = ['books.json', 'people.json', 'rentals.json']
  file_names.each do |name| 
    if File.exist?('./storage_files/'+ name)
      case name
      when 'books.json'
        if @books.any?
          books_data = JSON.generate(@books, {max_nesting: false})
          File.write("./storage_files/books.json", books_data)
        end
      when 'people.json'
        if @people.any? 
          people_data = JSON.generate(@people, {max_nesting: false})
          File.write("./storage_files/people.json", people_data)
        end 
      when 'rentals.json'
        if @rentals.any?
          rentals_data = JSON.generate(@rentals, {max_nesting: false})
          File.write("./storage_files/rentals.json", rentals_data)
        end
      end
    end
  end
end

module Load_data
  def load_books
    books = []
    if File.exist?('./storage_files/books.json')
      data = File.read("./storage_files/books.json")
      if data != ""
        JSON.parse(data).map do |book|
          books.push(Book.new(book['title'], book['author']))
        end
      end
    end
  books
end

def load_people
  people = []
  if File.exist?('./storage_files/people.json')
    data = File.read("./storage_files/people.json")
      if data != ""
        JSON.parse(data).map do |person|
        if person['json_class'] == "Student"
          people.push(Student.new(person['name'], person['age'], person['parent_permission']))
        else
          people.push(Teacher.new(person['name'], person['age'], person['specialization']))
        end
      end
    end
  end
people
end

def load_rentals
rentals = []
if File.exist?('./storage_files/rentals.json')
  data = File.read("./storage_files/rentals.json")
      if data != ""
        JSON.parse(data).map do |rental|
          puts rental
          person_id = rental['person']['id']
          book_id = rental['book']['id']
          puts rental['date']
          puts get_book(book_id)
          puts get_person(person_id)
          rentals.push(Rental.new(get_person(person_id), get_book(book_id), rental['date']))
        end
      end
end
rentals
end
def get_person(id)
  # @people.select {|person| person.id == id}[0]
  @people.each do |person|
    if person.id == id
      puts person.id
    end
  end
  person_needed
  end
def get_book(id)
  # @books.select {|book| book.id == id}[0]
  @books.each do |book|
    if book.id == id
      book
    end
  end
end
end
