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

