require_relative 'book'
require_relative 'classroom'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

classroom1 = Classroom.new("maths")
puts classroom1
student1 = Student.new("Florin", 27, false, classroom1)
puts student1

puts ''

puts student1.name
puts student1.classroom.label

student1.classroom = Classroom.new("science")
print student1.classroom.students
puts

puts student1.