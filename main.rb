require './person'
require './classroom'
require './student'

$people = []

def person_information
  puts 'Your name'
  name = gets.chomp
  puts 'Your age'
  age = gets.chomp
  puts 'permissin Y/N'
  permission = gets.chomp
  permission = permission == 'y'
  [age, name, permission]
end

def create_person(choice)
  case choice
  when 1
    info = person_information
    puts 'Classrrom'
    get_classroom = gets.chomp
    classroom = Classroom.new(get_classroom)
    $people << Student.new(classroom: classroom, age: info[0], name: info[1], parent_permission: info[2])
    puts "Student created successfully \n"
  when 2
    puts 'Working on teacher'
  else
    puts 'please choose between 1 or 2'
    choice = gets.chomp
    create_person(choice.to_i)
  end
end

def list_all_peaple
  if $people.size.zero?
    puts 'No people exist'
  else
    $people.each { |person| puts "List of all members \n name: #{person.name} | age: #{person.age}" }
  end
end

def list_of_books
  if $books.size.zero?
    puts 'No books'
  else
    $books.each {|book| puts "List of all books \n Title: #{book.title} | Author: #{book.author}"}
  end
end

def continue
  puts "Do you want to continue: \n
  1: Continue
  0: Exit"
  continue = gets.chomp
  main if continue == '1'
end

def main
  puts " Welcome to school library App! \n\n Please chhose an option by enterin a number:
      1- List all books.
      2- List all people.
      3- Create a person (teacher or student, not a plain Person).
      4- Create a book.
      5- Create a rental.
      6- List all rentals for a given person id."
  choose = gets.chomp
  case choose.to_i
  when 1
    list_of_books
    continue
  when 2
    list_all_peaple
    continue
  when 3
    puts 'Do you want to create a student (1) or teacher (2)'
    choice = gets.chomp
    create_person(choice.to_i)
    continue
  else
    puts 'The number should be between 1 and 7'
    main
  end
  puts 'thanks'
end

main
