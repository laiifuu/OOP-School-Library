require_relative 'book'
require_relative 'classroom'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'


class App 
  attr_reader :students, :teachers, :classrooms, :books, :rentals
  
  def initialize 
    @people = []
    @classrooms = []
    @books = []
    @rentals = []    
  end

  def add_person(person)
    @people.push(person)
  end


  def add_book(book)
    @books.push(book)
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def add_classroom(classroom)
    @classroom.push(classroom)
  end

  def list_books
    @books.each_with_index { |book, index|
      puts "#{index})- Title: #{book.title}, Author: #{book.author}"
    }
  end

  def list_people
    @people.each { |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    }
  end

  def list_rentals
    puts "ID of person: "
    id = gets.chomp.to_i
    puts "Rentals: "
    @people.each  { |person|
      if person.id == id
        person.rentals.each {|rental| 
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        }
      end
    }
  end

  def  create_person
    puts "Do you want to create a student (1) or a teeacher (2)? [Input the number]: "
    number = gets.chomp.to_i
    puts "Age: "
    age = gets.chomp.to_i
    puts "Name: "
    name = gets.chomp
    if number == 1 
      puts "Has parent permission?[Y/N]: "
      if gets.chomp.match(/(n|N)/)
        parent_permission  = false
      else 
        parent_permission = true
      end
      person = Student.new(name, age, parent_permission: parent_permission)
    end
    if number == 2 
      puts "Specialization: "
      specialization = gets.chomp
      person = Teacher.new(name, age, specialization)
    end
    self.add_person(person)
    puts "Person created successfully."
  end 

  def create_book
    puts "Title: "
    title = gets.chomp
    puts "Author: "
    author = gets.chomp
    book = Book.new(title, author)
    self.add_book(book)
    puts "Book created successfully."
  end

  def create_rental
    puts "Select a book from the following list by number: "
    list_books()
    book_id = gets.chomp.to_i
    puts "Select a person from the following list by number: "
    list_people()
    person_id = gets.chomp.to_i
    puts "Date: "
    date = gets.chomp
    rental = Rental.new(@people[person_id], @books[book_id], date)
    self.add_rental(rental)
    puts "Rental created successfully."
  end

  def run
    exit = false
    while !exit do
      welcome_text = "Welcome to School Library App!
      
      Please choose an option by entering a number:
      1- List all books
      2- List all people 
      3- Create a person
      4- Create a book
      5- Create a rental
      6- List all rentals for a given person id
      7- Exit" 

      puts welcome_text
      choice = gets.to_i
    
      case choice
      when 1
        list_books()
      when 2 
        list_people()
      when 3
        create_person()
      when 4
        create_book()
      when 5
        create_rental()
      when 6
        list_rentals()
      when 7
        exit = true
      else
        puts "Error friend, wrong input. Sorry I don't make the rules ¯\\(ツ)/¯"
      end

    end
  end
end

def main
  app = App.new
  app.run
end

main()