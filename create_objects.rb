require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'teacher'

def create_person
  print 'Do you want to create a student (1) or a teeacher (2)? [Input the number]: '
  number = gets.chomp.to_i
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  person = create_student(name, age) if number == 1
  person = create_teacher(name, age) if number == 2
  add_person(person)
  puts 'Person created successfully.'
end

def create_student(name, age)
  print 'Has parent permission?[Y/N]: '
  parent_permission = if gets.chomp.match(/(n|N)/)
                        false
                      else
                        true
                      end
  Student.new(name, age, parent_permission: parent_permission)
end

def create_teacher(name, age)
  print 'Specialization: '
  specialization = gets.chomp
  Teacher.new(name, age, specialization)
end

def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  book = Book.new(title, author)
  add_book(book)
  puts 'Book created successfully.'
end

def create_rental
  puts 'Select a book from the following list by number: '
  list_books
  book_id = gets.chomp.to_i
  puts 'Select a person from the following list by number: '
  list_people
  person_id = gets.chomp.to_i
  print 'Date: '
  date = gets.chomp
  rental = Rental.new(@people[person_id], @books[book_id], date)
  add_rental(rental)
  puts 'Rental created successfully.'
end
